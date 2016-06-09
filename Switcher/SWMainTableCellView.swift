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
    let enterPasswordSheet = SWEnterPasswordWindowController(windowNibName: "SWEnterPasswordWindowController")

    @IBAction func loginAppStore(sender: NSButton) {
        enterPasswordSheet.loginType = SWLoginType.AppStore
        commonLogin()
    }

    @IBAction func loginiTunes(sender: NSButton) {
        enterPasswordSheet.loginType = SWLoginType.iTunes
        commonLogin()
    }
    
    private func commonLogin() {
        let userName = emailTextField.stringValue
        if let password = SWAccountManager.sharedInstance.getPasswordWith(userName) {
            enterPasswordSheet.passwordTextField.stringValue = password
        }
        
        enterPasswordSheet.userName = userName
        NSApplication.sharedApplication().mainWindow?.beginSheet(enterPasswordSheet.window!, completionHandler: nil)
    }
}
