//
//  ContentView.swift
//  JailBreak-Check-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/06/01.
//

import SwiftUI

struct ContentView: View {
    @State var isDeviceJailBroken: Bool = false
    var body: some View {
        Text(isDeviceJailBroken ? "❌: 脱獄あり" : "✅: 脱獄なし")
            .onAppear() {
                #if !targetEnvironment(simulator)
                checkDeviceJailBroken()
                #endif
            }
    }
    // 脱獄判定
    func checkDeviceJailBroken() {
        if access("/Applications/Cydia.app", F_OK) != -1 ||
            access("/Applications/blackra1n.app", F_OK) != -1 ||
            access("/Applications/FakeCarrier.app", F_OK) != -1 ||
            access("/Applications/Icy.app", F_OK) != -1 ||
            access("/Applications/IntelliScreen.app", F_OK) != -1 ||
            access("/Applications/MxTube.app", F_OK) != -1 ||
            access("/Applications/RockApp.app", F_OK) != -1 ||
            access("/Applications/SBSettings.app", F_OK) != -1 ||
            access("/Applications/WinterBoard.app", F_OK) != -1 ||
            access("/Library/MobileSubstrate/MobileSubstrate.dylib", F_OK) != -1 ||
            access("/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist", F_OK) != -1 ||
            access("/Library/MobileSubstrate/DynamicLibraries/Veency.plist", F_OK) != -1 ||
            access("/private/var/lib/apt", F_OK) != -1 ||
            access("/private/var/lib/cydia", F_OK) != -1 ||
            access("/private/var/mobile/Library/SBSettings/Themes", F_OK) != -1 ||
            access("/private/var/stash", F_OK) != -1 ||
            access("/private/var/tmp/cydia.log", F_OK) != -1 ||
            access("/System/Library/LaunchDaemons/com.ikey.bbot.plist", F_OK) != -1 ||
            access("/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist", F_OK) != -1 ||
            access("/usr/bin/sshd", F_OK) != -1 ||
            access("/usr/libexec/sftp-server", F_OK) != -1 ||
            access("/usr/sbin/sshd", F_OK) != -1 ||
            access("/bin/bash", F_OK) != -1 ||
            access("/etc/apt", F_OK) != -1
        {
            isDeviceJailBroken = true
        } else if let url = URL(string: "cydia://package/com.example.package") {
            if UIApplication.shared.canOpenURL(url) {
                isDeviceJailBroken = true
            } else {
                isDeviceJailBroken = false
            }
        } else {
            isDeviceJailBroken = false
        }
    }
}
