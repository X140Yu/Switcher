//
//  SWAppLoginManager.swift
//  Switcher
//
//  Created by X140Yu on 6/9/16.
//  Copyright © 2016 X140Yu. All rights reserved.
//

import Foundation
import AppKit

class SWAppLoginManager {
    static func loginAppStoreWith(_ appleID: String, password: String) {

        let path = Bundle.main.path(forResource: "AppStore", ofType: "txt")
        var content = try! NSString(contentsOfFile: path!, encoding: 0) as String
        content = content.replacingOccurrences(of: "$APP_ID", with: appleID)
        content = content.replacingOccurrences(of: "$PASSWORD", with: password)

        let appleScript = NSAppleScript(source: content)

        var errorInfo: NSDictionary? = nil
        appleScript!.executeAndReturnError(&errorInfo)
        if let _ = errorInfo {
            ErrorHanding.showErrorDialog()
        }
    }
    
    static func loginiTnesWith(_ appleID: String, password: String) {

        let path = Bundle.main.path(forResource: "iTunes", ofType: "txt")
        var content = try! NSString(contentsOfFile: path!, encoding: 0) as String
        content = content.replacingOccurrences(of: "$APP_ID", with: appleID)
        content = content.replacingOccurrences(of: "$PASSWORD", with: password)

        let appleScript = NSAppleScript(source: content)

        var errorInfo: NSDictionary? = nil
        appleScript!.executeAndReturnError(&errorInfo)
        if let _ = errorInfo {
            ErrorHanding.showErrorDialog()
        }
    }
}

struct ErrorHanding {
    static func showErrorDialog() {
        let alert = NSAlert()
        alert.messageText = "Sorry, some errors occured. :("
        alert.informativeText = "Please try again."
        alert.addButton(withTitle: "Ok")
        alert.runModal()
    }
}
