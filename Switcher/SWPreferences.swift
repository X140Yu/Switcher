//
//  SWPreferences.swift
//  Switcher
//
//  Created by X140Yu on 7/5/16.
//  Copyright © 2016 X140Yu. All rights reserved.
//

import Foundation

final class SWPreferences {

    private struct Keys {
        static let ShowMenuBarKey = "SWShowMenuBarKey"
        static let PasswordOnDisk = "SWPasswordOnDisk"
    }
    
    static func showMenuBar() -> Bool {
        if NSUserDefaults.standardUserDefaults().objectForKey(Keys.ShowMenuBarKey) != nil {
            return NSUserDefaults.standardUserDefaults().boolForKey(Keys.ShowMenuBarKey)
        }
        return true
    }
    
    static func saveShowMenuBarOption(option: Bool) {
        NSUserDefaults.standardUserDefaults().setBool(option, forKey: Keys.ShowMenuBarKey)
    }
    
    // default is false
    static func passwordOnDisk() -> Bool {
        return NSUserDefaults.standardUserDefaults().boolForKey(Keys.PasswordOnDisk)
    }
    
    static func savePasswordOnDiskOption(option: Bool) {
        NSUserDefaults.standardUserDefaults().setBool(option, forKey: Keys.PasswordOnDisk)
    }
}