//
//  AppDelegate.swift
//  hiddenFiles
//
//  Created by Markus Mächler on 19/01/15.
//  Copyright (c) 2015 Markus Mächler. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var window: NSWindow!
    
    let statusItem = NSStatusBar.system().statusItem(withLength: -1)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.title = "HF"
        statusItem.menu = statusMenu
    }
    
    @IBAction func menuClicked(_ sender: NSMenuItem) {
        let task = Process()
        task.launchPath = "/usr/bin/defaults"
        
        if(sender.state == NSOnState) {
            sender.state = NSOffState
            task.arguments = ["write", "com.apple.finder", "AppleShowAllFiles", "NO"]
        } else {
            sender.state = NSOnState
            task.arguments = ["write", "com.apple.finder", "AppleShowAllFiles", "YES"]
        }
        
        task.launch()
        task.waitUntilExit()
        
        let killtask = Process()
        killtask.launchPath = "/usr/bin/killall"
        killtask.arguments = ["Finder"]
        killtask.launch()
    }
    
}
