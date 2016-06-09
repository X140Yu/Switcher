//
//  SWMainViewController.swift
//  Switcher
//
//  Created by X140Yu on 5/28/16.
//  Copyright © 2016 X140Yu. All rights reserved.
//

import Cocoa

protocol SWAddAccountDelegate: class {
    func didAddAccount(userName: String)
}

class SWMainViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    let newAccountSheet = SWNewAccountWindowController(windowNibName: "SWNewAccountWindowController")
    var userNameArray = SWAccountManager.getUserNameArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newAccountSheet.delegate = self
    }
    
    func showAddAccountWindow(sender: NSMenuItem) {
        sender.hidden = true
        NSApplication.sharedApplication().mainWindow?.beginSheet(newAccountSheet.window!, completionHandler: { (response) in
            sender.hidden = false
        })
    }
}

// MARK: - TableView DataSource
extension SWMainViewController: NSTableViewDataSource {
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return userNameArray.count
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = tableView.makeViewWithIdentifier("cell", owner: self) as! SWMainTableCellView
        cell.emailTextField.stringValue = userNameArray[row]
        return cell
    }
}

// MARK: - Menu Action
extension SWMainViewController {
    @IBAction func deleteAccount(sender: NSMenuItem) {
        let row = tableView.clickedRow
        SWAccountManager.removeUserNameAt(row)
        userNameArray =  SWAccountManager.getUserNameArray()
        tableView.reloadData()
    }
}

// MARK: - Delegate Methods
extension SWMainViewController: SWAddAccountDelegate {
    func didAddAccount(userName: String) {
        SWAccountManager.save(userName)
        userNameArray = SWAccountManager.getUserNameArray()
        tableView.reloadData()
    }
}

