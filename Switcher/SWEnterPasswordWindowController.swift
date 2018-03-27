//
//  SWEnterPasswordWindowController.swift
//  Switcher
//
//  Created by X140Yu on 6/9/16.
//  Copyright © 2016 X140Yu. All rights reserved.
//

import Cocoa

enum SWLoginType {
    case none
    case appStore
    case iTunes
}

class SWEnterPasswordWindowController: NSWindowController {

    @IBOutlet weak var passwordTextField: NSSecureTextField!
    @IBOutlet weak var prompotTextField: NSTextField!
    var userName = ""
    var password = ""
    var loginType = SWLoginType.none

    override func windowDidLoad() {
        super.windowDidLoad()
        prompotTextField.stringValue = "Enter password for \(userName)"
        passwordTextField.stringValue = password
    }

    @IBAction func signIn(_ sender: NSButton) {
        let password = passwordTextField.stringValue
        guard password.isEmpty == false else { return }
        guard let window = window else { return }
        SWAccountManager.sharedInstance.save(password, with: userName)
        window.sheetParent?.endSheet(window, returnCode: .OK)
        SWAppLoginManager.loginWith(loginType, appleID: userName, password: password)
    }

    @IBAction func cancel(_ sender: NSButton) {
        guard let window = window else { return }
        window.sheetParent?.endSheet(window, returnCode: .cancel)
    }
}
