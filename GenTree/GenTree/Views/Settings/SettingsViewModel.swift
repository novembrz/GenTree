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
        
        @Published var showViews: [Bool] = Array(repeating: false, count: 4)
        
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
        
        //MARK: - Animate
        
        func animateViews() {
            withAnimation(.easeInOut) {
                showViews[0] = true
            }
            
            withAnimation(.easeInOut.delay(0.1)) {
                showViews[1] = true
            }
            
            withAnimation(.easeInOut.delay(0.15)) {
                showViews[2] = true
            }
            
            withAnimation(.easeInOut.delay(0.2)) {
                showViews[3] = true
            }
        }
    }
}
