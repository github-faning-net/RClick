//
//  AppDelegate.swift
//  RClick
//
//  Created by 李旭 on 2024/4/10.
//

import AppKit
import Cocoa
import Foundation
import os.log

private let logger = Logger(subsystem: subsystem, category: "main")

class AppDelegate: NSObject, NSApplicationDelegate {
    let messager = Messager()
    var folderItemStore = FolderItemStore()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // 在 app 启动后执行的函数
        logger.notice("App -------------------------- 已启动")

//        for nswin in NSApplication.shared.windows {
//            nswin.makeKeyAndOrderFront(1)
//        }

        Task {
            await channel.setup(store: folderItemStore)
        }

        messager.start(name: Key.messageFromFinder)
//        Task {
//       //                await channel.setup(store: folderItemStore)
//       //            }
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return false
    }

    func applicationWillTerminate(_ notification: Notification) {}
}
