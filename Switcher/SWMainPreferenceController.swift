//
//  SWMainPreferenceController.swift
//  Switcher
//
//  Created by X140Yu on 7/5/16.
//  Copyright © 2016 X140Yu. All rights reserved.
//

import Cocoa

class SWMainPreferenceController: NSViewController, MASPreferencesViewController {

    @IBOutlet weak var menuBarBox: NSButton!
    @IBOutlet weak var passwordOnDiskBox: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuBarBox.state = SWPreferences.showMenuBar() == true ? 1 : 0
        passwordOnDiskBox.state = SWPreferences.passwordOnDisk() == true ? 1 : 0
    }
    
    // MARK: - IBAction    
    @IBAction func clickMenuBarBox(sender: NSButton) {
        if sender.state == 1 {
            SWPreferences.saveShowMenuBarOption(true)
        } else {
            SWPreferences.saveShowMenuBarOption(false)
        }
    }

    @IBAction func clickPasswordBox(sender: NSButton) {
        if sender.state == 1 {
            SWPreferences.savePasswordOnDiskOption(true)
        } else {
            SWAccountManager.clearPasswordDiskCache()
            SWPreferences.savePasswordOnDiskOption(false)
        }
    }

    // MARK: - Override
    override var identifier: String? {
        get {
            return "GeneralPreference"
        }
        set {
            super.identifier = newValue
        }
    }
    
    var toolbarItemImage: NSImage! {
        return NSImage(named : NSImageNamePreferencesGeneral)!
    }
    
    var toolbarItemLabel: String {
        return "General"
    }
}
