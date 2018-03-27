//
//  SWMainTableCellView.swift
//  Switcher
//
//  Created by X140Yu on 6/4/16.
//  Copyright © 2016 X140Yu. All rights reserved.
//

import Cocoa

class SWMainTableCellView: NSTableCellView {

    @IBOutlet weak var emailTextField: NSTextField!
    let enterPasswordSheet = SWEnterPasswordWindowController(windowNibName: NSNib.Name(rawValue: "SWEnterPasswordWindowController"))

    @IBAction func loginAppStore(_ sender: NSButton) {
        enterPasswordSheet.loginType = SWLoginType.appStore
        commonLogin()
    }

    @IBAction func loginiTunes(_ sender: NSButton) {
        enterPasswordSheet.loginType = SWLoginType.iTunes
        commonLogin()
    }

    fileprivate func commonLogin() {
        let userName = emailTextField.stringValue
        if let password = SWAccountManager.sharedInstance.getPasswordWith(userName) {
            enterPasswordSheet.password = password
        } else {
            enterPasswordSheet.password = ""
        }

        enterPasswordSheet.userName = userName

        guard let window = enterPasswordSheet.window else { return }
        NSApplication.shared.mainWindow?.beginSheet(window, completionHandler: nil)
    }
}
