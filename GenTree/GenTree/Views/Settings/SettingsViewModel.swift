//
//  SettingsViewModel.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 24.02.2023.
//

import SwiftUI

extension SettingsView {
    
    struct SettingsItem: Hashable {
        let title: String
        let icon: String
        var color: Color? = .text()
    }
    
    @MainActor class SettingsViewModel: ObservableObject {
        
        var settingsFields: [SettingsItem] = [
            SettingsItem(title: "Настройки", icon: "Settings"),
            SettingsItem(title: "Редактировать профиль", icon: "Pen"),
            SettingsItem(title: "Синхронизировать деревья", icon: "Tree")
        ]
        
        var footerFields: [SettingsItem] = [
            SettingsItem(title: "Выйти", icon: "LogOut"),
            SettingsItem(title: "Удалить аккаунт", icon: "XCircle", color: .dangerous())
        ]
        
        func logOut() {}
    }
}
