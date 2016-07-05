//
//  SWAccountManager.swift
//  Switcher
//
//  Created by X140Yu on 6/9/16.
//  Copyright © 2016 X140Yu. All rights reserved.
//

import Foundation


final class SWAccountManager {
    static let sharedInstance = SWAccountManager()
    private init() {}
    private let passwordCache = NSCache()
    
    private struct Keys {
        static let UserNameArrayKey = "SWUserNameArray"
        static let UserNameCountKey = "SWUserNameCount"
    }
    
    // MARK: UserName
    static func save(userName: String) {
        var userNameArray = getUserNameArray()
        userNameArray.append(userName)
        NSUserDefaults.standardUserDefaults().setObject(userNameArray, forKey: Keys.UserNameArrayKey)
    }

    static func getUserNameArray() -> Array<String> {
        if NSUserDefaults.standardUserDefaults().objectForKey(Keys.UserNameArrayKey) != nil {
            return NSUserDefaults.standardUserDefaults().objectForKey(Keys.UserNameArrayKey) as! Array
        }
        return []
    }
    
    static func removeUserNameAt(index: Int) {
        var userNameArray = getUserNameArray()
        userNameArray.removeAtIndex(index)
        NSUserDefaults.standardUserDefaults().setObject(userNameArray, forKey: Keys.UserNameArrayKey)
    }
    
    static func getUsernameCount() -> Int {
        return getUserNameArray().count
    }
    
    // MARK: Password
    func getPasswordWith(userName: String) -> String? {
        if SWPreferences.passwordOnDisk() == false {
            return passwordCache.objectForKey(userName) as? String ?? ""
        } else {
            return NSUserDefaults.standardUserDefaults().objectForKey(userName) as? String ?? ""
        }
    }
    
    func save(password: String, with userName: String) {
        if SWPreferences.passwordOnDisk() == false {
            passwordCache.setObject(password, forKey: userName)
        } else {
            NSUserDefaults.standardUserDefaults().setObject(password, forKey: userName)
        }
    }
    
    static func clearPasswordDiskCache() {
        let userNameArray =  SWAccountManager.getUserNameArray()
        userNameArray.forEach { (username) in
            NSUserDefaults.standardUserDefaults().removeObjectForKey(username)
        }
    }
}