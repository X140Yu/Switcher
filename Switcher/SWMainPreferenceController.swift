//
//  SWMainPreferenceController.swift
//  Switcher
//
//  Created by X140Yu on 7/5/16.
//  Copyright © 2016 X140Yu. All rights reserved.
//

import Cocoa
import MASPreferences

class SWMainPreferenceController: NSViewController, MASPreferencesViewController {

    @IBOutlet weak var menuBarBox: NSButton!
    @IBOutlet weak var passwordOnDiskBox: NSButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        menuBarBox.state = NSControl.StateValue(rawValue: SWPreferences.showMenuBar() == true ? 1 : 0)
        passwordOnDiskBox.state = NSControl.StateValue(rawValue: SWPreferences.passwordOnDisk() == true ? 1 : 0)
    }

    // MARK: - IBAction    
    @IBAction func clickMenuBarBox(_ sender: NSButton) {
        if sender.state.rawValue == 1 {
            SWPreferences.saveShowMenuBarOption(true)
        } else {
            SWPreferences.saveShowMenuBarOption(false)
        }
    }

    @IBAction func clickPasswordBox(_ sender: NSButton) {
        if sender.state.rawValue == 1 {
            SWPreferences.savePasswordOnDiskOption(true)
        } else {
            SWAccountManager.clearPasswordDiskCache()
            SWPreferences.savePasswordOnDiskOption(false)
        }
    }

    var viewIdentifier: String {
        return "GeneralPreference"
    }

    var toolbarItemImage: NSImage? {
        return NSImage(named: .preferencesGeneral)
    }

    var toolbarItemLabel: String? {
        return "General"
    }
}
