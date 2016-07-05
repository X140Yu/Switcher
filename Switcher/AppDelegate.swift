//
//  AppDelegate.swift
//  Switcher
//
//  Created by X140Yu on 5/28/16.
//  Copyright © 2016 X140Yu. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    lazy var preferenceWindowController: NSWindowController = {
        let preferenceMain = SWMainPreferenceController()
        let _preferenceWindowController = MASPreferencesWindowController(viewControllers: [preferenceMain], title: "Preferences")
        return _preferenceWindowController
    }()


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        NSApplication.sharedApplication().windows[0].releasedWhenClosed = false
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldHandleReopen(sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        if flag == true {
            return false
        } else {
            NSApplication.sharedApplication().windows[0].makeKeyAndOrderFront(self)
            return true
        }
    }
    @IBAction func openPreferencesWindow(sender: NSMenuItem) {
        preferenceWindowController.showWindow(nil)
    }

    @IBAction func handleNewAccountItemAction(sender: NSMenuItem) {
        let viewController = NSApplication.sharedApplication().mainWindow?.contentViewController as! SWMainViewController
        viewController.showAddAccountWindow(sender)
    }

    @IBAction func openGitHubRepoLink(sender: NSMenuItem) {
        let url = NSURL(string: "https://github.com/X140Yu/Switcher")!
        NSWorkspace.sharedWorkspace().openURL(url)
    }
}

