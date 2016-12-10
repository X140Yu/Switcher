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
        return _preferenceWindowController!
    }()


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        NSApplication.shared().windows[0].isReleasedWhenClosed = false
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        if flag == true {
            return false
        } else {
            NSApplication.shared().windows[0].makeKeyAndOrderFront(self)
            return true
        }
    }
    @IBAction func openPreferencesWindow(_ sender: NSMenuItem) {
        preferenceWindowController.showWindow(nil)
    }

    @IBAction func handleNewAccountItemAction(_ sender: NSMenuItem) {
        let viewController = NSApplication.shared().mainWindow?.contentViewController as! SWMainViewController
        viewController.showAddAccountWindow(sender)
    }

    @IBAction func openGitHubRepoLink(_ sender: NSMenuItem) {
        let url = URL(string: "https://github.com/X140Yu/Switcher")!
        NSWorkspace.shared().open(url)
    }
}

