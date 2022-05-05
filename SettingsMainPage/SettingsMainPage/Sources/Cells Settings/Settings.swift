//
//  Settings.swift
//  SettingsMainPage
//
//  Created by Daniil Yarkovenko on 06.05.2022.
//

import UIKit

protocol Settings {
    var title: String { get set }
    var icon: UIImage? { get set }
    var iconBackgroundColor: UIColor { get set }
}

struct SettingsStaticOption: Settings {
    var title: String
    var icon: UIImage?
    var iconBackgroundColor: UIColor
}

struct SettingsSwitchOption: Settings {
    var title: String
    var icon: UIImage?
    var iconBackgroundColor: UIColor
    var isOn: Bool
}

enum SettingsOptionType {
    case staticCell(model: SettingsStaticOption)
    case switchCell(model: SettingsSwitchOption)
}

struct Section {
    let options: [SettingsOptionType]
}
