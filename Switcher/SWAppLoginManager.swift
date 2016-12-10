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
        let appleScript = NSAppleScript(source:
            "on appIsRunning(appName)\n" +
            "    tell application \"System Events\" to (name of processes) contains appName\n" +
            "end appIsRunning\n" +
                
            "on startApp(appName)\n" +
            "    set IsRunning to false\n" +
            "    set tries to 20\n" +
            "    repeat until (IsRunning is true or tries is 0)\n" +
            "        set IsRunning to appIsRunning(appName)\n" +
            "        set tries to (tries - 1)\n" +
            "        delay 0.1\n" +
            "    end repeat\n" +
            "end startApp\n" +
                
            "startApp(\"App Store\")\n" +
                
            "do shell script \"open -a App\\\\ Store\"\n" +
            "tell application \"System Events\" to tell process \"App Store\" \n" +
            "    set frontmost to true\n" +
            "    key code 53\n" +
            "    try\n" +
            "        click menu item 12 of menu 1 of menu bar item 4 of menu bar 1\n" +
            "    end try\n" +
            "    delay 0.5\n" +
            "    click menu item 12 of menu 1 of menu bar item 4 of menu bar 1\n" +
            "    repeat until exists sheet 1 of window 1\n" +
            "        delay 0.2\n" +
            "    end repeat\n" +
            "    set value of text field 2 of sheet 1 of window 1 to \"\(appleID)\" \n" +
            "    set value of text field 1 of sheet 1 of window 1 to \"\(password)\" \n" +
            "    delay 0.5\n" +
            "    keystroke return\n" +
            "end tell")
        
        var errorInfo: NSDictionary? = nil
        appleScript!.executeAndReturnError(&errorInfo)
        if let _ = errorInfo {
            ErrorHanding.showErrorDialog()
        }
    }
    
    static func loginiTnesWith(_ appleID: String, password: String) {
        let appleScript = NSAppleScript(source:
            "on appIsRunning(appName)\n" +
            "    tell application \"System Events\" to (name of processes) contains appName\n" +
            "end appIsRunning\n" +
                
            "on startApp(appName)\n" +
            "    set IsRunning to false\n" +
            "    set tries to 20\n" +
            "    repeat until (IsRunning is true or tries is 0)\n" +
            "        set IsRunning to appIsRunning(appName)\n" +
            "        set tries to (tries - 1)\n" +
            "        delay 0.1\n" +
            "    end repeat\n" +
            "end startApp\n" +
                
            "startApp(\"iTunes\")\n" +
                
            "do shell script \"open -a iTunes\"\n" +
            "tell application \"System Events\" to tell process \"iTunes\" \n" +
            "    set frontmost to true\n" +
            "    key code 53\n" +
            "    try\n" +
            "        click menu item 6 of menu 1 of menu bar item 8 of menu bar 1\n" +
            "    end try\n" +
            "    delay 0.5\n" +
            "    click menu item 2 of menu 1 of menu bar item 8 of menu bar 1\n" +
            "    delay 0.2\n" +
            "    keystroke \"\(appleID)\"\n" +
            "    keystroke tab\n" +
            "    keystroke \"\(password)\"\n" +
            "    keystroke return\n" +
            "end tell")
        
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
