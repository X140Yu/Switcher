//
//  SWMainTableView.swift
//  Switcher
//
//  Created by X140Yu on 6/4/16.
//  Copyright © 2016 X140Yu. All rights reserved.
//

import Cocoa

class SWMainTableView: NSTableView {
    
    /**
     Draw grid lines in NSTableView only for populated rows.
     Origin soultion from http://stackoverflow.com/a/6844340/6343571
     */
    override func drawGridInClipRect(clipRect: NSRect) {
        let lastRowRect = rectOfRow(numberOfRows - 1)
        let myClipRect = NSRect(x: 0, y: 0, width: lastRowRect.size.width, height: NSMaxY(lastRowRect))
        let finalClipRect = NSIntersectionRect(clipRect, myClipRect)
        super.drawGridInClipRect(finalClipRect)
    }

}
