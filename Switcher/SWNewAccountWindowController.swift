//
//  SWNewAccountWindowController.swift
//  Switcher
//
//  Created by X140Yu on 6/9/16.
//  Copyright © 2016 X140Yu. All rights reserved.
//

import Cocoa

class SWNewAccountWindowController: NSWindowController {

    weak var delegate: SWAddAccountDelegate?
    @IBOutlet weak var textField: NSTextField!

    override func windowDidLoad() {
        super.windowDidLoad()
        textField.stringValue = ""
    }

    @IBAction func addAccount(_ sender: NSButton) {
        let appleID = textField.stringValue
        guard let window = window else { return }
        if appleID.isEmpty == false {
            delegate?.didAddAccount(appleID)
            window.sheetParent?.endSheet(window, returnCode: .OK)
        }
    }

    @IBAction func cancel(_ sender: NSButton) {
        guard let window = window else { return }
        window.sheetParent?.endSheet(window, returnCode: .cancel)
    }
}
