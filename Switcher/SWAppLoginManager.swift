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

    static func loginWith(_ type: SWLoginType, appleID: String, password: String) {
        var resourceName: String = ""
        switch type {
        case .appStore:
            resourceName = "AppStore"
        case .iTunes:
            resourceName = "iTunes"
        case .none:
            assertionFailure("should not be none")
        }
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "txt") else { return }
        guard let content = try? NSString(contentsOfFile: path, encoding: 0) as String else { return }
        guard let appleScript = NSAppleScript(source: processScript(content, appleID: appleID, password: password)) else { return }

        var errorInfo: NSDictionary? = nil
        appleScript.executeAndReturnError(&errorInfo)
        if errorInfo != nil {
            ErrorHanding.showErrorDialog()
        }
    }

    static func processScript(_ content: String, appleID: String, password: String) -> String {
        let result = content.replacingOccurrences(of: "$APP_ID", with: appleID)
        return result.replacingOccurrences(of: "$PASSWORD", with: password)
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
