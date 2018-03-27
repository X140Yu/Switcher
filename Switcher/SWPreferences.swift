//
//  SWPreferences.swift
//  Switcher
//
//  Created by X140Yu on 7/5/16.
//  Copyright © 2016 X140Yu. All rights reserved.
//

import Foundation

final class SWPreferences {

    fileprivate struct Keys {
        static let ShowMenuBarKey = "SWShowMenuBarKey"
        static let PasswordOnDisk = "SWPasswordOnDisk"
    }

    static func showMenuBar() -> Bool {
        if UserDefaults.standard.object(forKey: Keys.ShowMenuBarKey) != nil {
            return UserDefaults.standard.bool(forKey: Keys.ShowMenuBarKey)
        }
        return true
    }

    static func saveShowMenuBarOption(_ option: Bool) {
        UserDefaults.standard.set(option, forKey: Keys.ShowMenuBarKey)
    }

    // default is false
    static func passwordOnDisk() -> Bool {
        return UserDefaults.standard.bool(forKey: Keys.PasswordOnDisk)
    }

    static func savePasswordOnDiskOption(_ option: Bool) {
        UserDefaults.standard.set(option, forKey: Keys.PasswordOnDisk)
    }
}
