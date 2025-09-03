//
//  SettingsModel.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 8/27/25.
//
import UIKit
enum SettingsItem {
    case toggle(icon: String, iconColor: UIColor, title: String, isOn: Bool)
    case link(icon: String, iconColor: UIColor, title: String, value: String? = nil)
}
struct SettingsSection { let rows: [SettingsItem]
    static func getSettingsList() -> [SettingsSection]{
        return [
            SettingsSection(rows: [
                .toggle(icon: "airplane", iconColor: .systemOrange, title: "Airplane Mode", isOn: false),
                .link(icon: "wifi", iconColor: .systemBlue, title: "Wi-Fi", value: "T-Mobile"),
                .link(icon: "bolt.horizontal", iconColor: .systemBlue, title: "Bluetooth", value: "Not Connected"),
                .link(icon: "antenna.radiowaves.left.and.right", iconColor: .systemGreen, title: "Cellular", value: "Off"),
                .link(icon: "personalhotspot", iconColor: .systemGreen, title: "Personal Hotspot", value: "Off"),
                .link(icon: "battery.100", iconColor: .systemGreen, title: "Battery")
            ]),
            SettingsSection(rows: [
                .link(icon: "gear", iconColor: .systemGray, title: "General"),
                .link(icon: "accessibility", iconColor: .systemBlue, title: "Accessibility"),
                .link(icon: "rectangle.and.hand.point.up.left", iconColor: .systemBlue, title: "Action Button"),
                .link(icon: "brain.head.profile", iconColor: .systemPink, title: "Apple Intelligence & Siri"),
                .link(icon: "camera", iconColor: .systemGray, title: "Camera"),
                .link(icon: "switch.2", iconColor: .systemGray, title: "Control Center"),
                .link(icon: "sun.max", iconColor: .systemBlue, title: "Display & Brightness"),
                .link(icon: "apps.iphone", iconColor: .systemBlue, title: "Home Screen & App Library"),
                .link(icon: "magnifyingglass", iconColor: .systemGray, title: "Search"),
                .link(icon: "bed.double", iconColor: .black, title: "StandBy"),
                .link(icon: "photo.on.rectangle", iconColor: .systemBlue, title: "Wallpaper")
            ]),
            SettingsSection(rows: [.link(icon: "bell.badge.fill", iconColor: .systemRed, title: "Notifications"),
                                   .link(icon: "speaker.wave.3.fill", iconColor: .systemRed, title: "Sounds & Haptics"),
                                   .link(icon: "moon.fill", iconColor: .systemPurple, title: "Focus"),
                                   .link(icon: "hourglass", iconColor: .systemIndigo, title: "Screen Time")]),
            SettingsSection(rows: [.link(icon: "faceid", iconColor: .systemGreen, title: "Face ID & Passcode"),
                                   .link(icon: "sos", iconColor: .systemRed, title: "Emergency SOS"),
                                   .link(icon: "hand.raised.fill", iconColor: .systemBlue, title: "Privacy & Security")]),
            SettingsSection(rows: [.link(icon: "gamecontroller.fill", iconColor: .systemTeal, title: "Game Center"),
                                   .link(icon: "icloud.fill", iconColor: .systemBlue, title: "iCloud"),
                                   .link(icon: "wallet.pass.fill", iconColor: .systemGray, title: "Wallet & Apple Pay")]),
            SettingsSection(rows: [.link(icon: "square.grid.2x2.fill", iconColor: .systemPurple, title: "Apps")
                                  ])
        ]
    }
}
