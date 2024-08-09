//
//  AppDelegate.swift
//  RClick
//
//  Created by 李旭 on 2024/4/10.
//

import AppKit
import Cocoa
import FinderSync
import Foundation
import os.log
import SwiftUI

private let logger = Logger(subsystem: subsystem, category: "AppDelegate")

class AppDelegate: NSObject, NSApplicationDelegate {
    let messager = Messager.shared
    var folderItemStore = FolderItemStore()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // 在 app 启动后执行的函数
        logger.notice("App -------------------------- 已启动")

        Task {
            await channel.setup(store: folderItemStore)
        }

        messager.start(name: Key.messageFromFinder)
        messager.sendMessage(name: "running", data: MessagePayload(action: "running"))
    }

    @objc func extensionDidBecomeActive() {
        print("Finder Sync Extension is active.")
    }

    @objc func extensionWillResignActive() {
        print("Finder Sync Extension is inactive.")
    }

    func applicationWillBecomeActive(_ notification: Notification) {
        let enable = FIFinderSyncController.isExtensionEnabled
        print("applicationDidBecomeActive , enable: \(enable)")
        UserDefaults.group.set(enable, forKey: "enable")
    }

    func applicationDidBecomeActive(_ notification: Notification) {
        print("applicationDidBecomeActive")

        NSApplication.shared.openSettings()
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return false
    }

    func applicationWillTerminate(_ notification: Notification) {}
}
