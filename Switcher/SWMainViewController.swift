//
//  SWMainViewController.swift
//  Switcher
//
//  Created by X140Yu on 5/28/16.
//  Copyright © 2016 X140Yu. All rights reserved.
//

import Cocoa

protocol SWAddAccountDelegate: class {
    func didAddAccount(_ userName: String)
}

class SWMainViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    let newAccountSheet = SWNewAccountWindowController(windowNibName: NSNib.Name(rawValue: "SWNewAccountWindowController"))
    var userNameArray = SWAccountManager.getUserNameArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newAccountSheet.delegate = self
    }
    
    func showAddAccountWindow(_ sender: NSMenuItem) {
        sender.isHidden = true
        NSApplication.shared.mainWindow?.beginSheet(newAccountSheet.window!, completionHandler: { (response) in
            sender.isHidden = false
        })
    }
}

// MARK: - TableView DataSource
extension SWMainViewController: NSTableViewDataSource, NSTableViewDelegate {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return userNameArray.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "cell"), owner: self) as! SWMainTableCellView
        cell.emailTextField.stringValue = userNameArray[row]
        return cell
    }
}

// MARK: - Menu Action
extension SWMainViewController {
    @IBAction func deleteAccount(_ sender: NSMenuItem) {
        let row = tableView.clickedRow
        SWAccountManager.removeUserNameAt(row)
        userNameArray =  SWAccountManager.getUserNameArray()
        tableView.reloadData()
    }
}

// MARK: - Delegate Methods
extension SWMainViewController: SWAddAccountDelegate {
    func didAddAccount(_ userName: String) {
        SWAccountManager.save(userName)
        userNameArray = SWAccountManager.getUserNameArray()
        tableView.reloadData()
    }
}

