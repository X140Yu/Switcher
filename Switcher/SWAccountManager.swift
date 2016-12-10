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
    fileprivate init() {}
    fileprivate let passwordCache = NSCache<AnyObject, AnyObject>()
    
    fileprivate struct Keys {
        static let UserNameArrayKey = "SWUserNameArray"
        static let UserNameCountKey = "SWUserNameCount"
    }
    
    // MARK: UserName
    static func save(_ userName: String) {
        var userNameArray = getUserNameArray()
        userNameArray.append(userName)
        UserDefaults.standard.set(userNameArray, forKey: Keys.UserNameArrayKey)
    }

    static func getUserNameArray() -> Array<String> {
        if UserDefaults.standard.object(forKey: Keys.UserNameArrayKey) != nil {
            return UserDefaults.standard.object(forKey: Keys.UserNameArrayKey) as! Array
        }
        return []
    }
    
    static func removeUserNameAt(_ index: Int) {
        var userNameArray = getUserNameArray()
        userNameArray.remove(at: index)
        UserDefaults.standard.set(userNameArray, forKey: Keys.UserNameArrayKey)
    }
    
    static func getUsernameCount() -> Int {
        return getUserNameArray().count
    }
    
    // MARK: Password
    func getPasswordWith(_ userName: String) -> String? {
        if SWPreferences.passwordOnDisk() == false {
            return passwordCache.object(forKey: userName as AnyObject) as? String ?? ""
        } else {
            return UserDefaults.standard.object(forKey: userName) as? String ?? ""
        }
    }
    
    func save(_ password: String, with userName: String) {
        if SWPreferences.passwordOnDisk() == false {
            passwordCache.setObject(password as AnyObject, forKey: userName as AnyObject)
        } else {
            UserDefaults.standard.set(password, forKey: userName)
        }
    }
    
    static func clearPasswordDiskCache() {
        let userNameArray =  SWAccountManager.getUserNameArray()
        userNameArray.forEach { (username) in
            UserDefaults.standard.removeObject(forKey: username)
        }
    }
}
