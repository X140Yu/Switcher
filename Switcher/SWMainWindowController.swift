//
//  SWMainWindowController.swift
//  Switcher
//
//  Created by X140Yu on 7/5/16.
//  Copyright © 2016 X140Yu. All rights reserved.
//

import Cocoa

class SWMainWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()

        // http://blog.seedlab.io/currencyx-like-window/
        if let window = self.window {
            window.titleVisibility = .hidden
            window.titlebarAppearsTransparent = true
        }
    }

}
