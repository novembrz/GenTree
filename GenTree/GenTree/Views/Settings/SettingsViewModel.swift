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
        
        @Published var showViews: [Bool] = Array(repeating: false, count: 7)
        
        var changeProfileFields: [SettingsItem] = [
            SettingsItem(title: .changePtofileText, icon: .changeIcon),
        ]
        
        var treeFields: [SettingsItem] = [
            SettingsItem(title: .changeTreeText, icon: .treeIcon),
            SettingsItem(title: .synchonizeText, icon: .treeIcon)
        ]
        
        var settingsFields: [SettingsItem] = [
            SettingsItem(title: .notificationText, icon: .bellIcon),
            SettingsItem(title: .themeText, icon: .moonIcon),
            SettingsItem(title: .languageText, icon: .globeIcon)
        ]
        
        var helpFields: [SettingsItem] = [
            SettingsItem(title: .chatText, icon: .messageIcon),
            SettingsItem(title: .appText, icon: .helpIcon)
        ]
        
        var footerFields: [SettingsItem] = [
            SettingsItem(title: .logOutText, icon: .logOutIcon),
            SettingsItem(title: .deleteText, icon: .circleIcon, color: .dangerous())
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
            
            withAnimation(.easeInOut.delay(0.25)) {
                showViews[4] = true
            }
            
            withAnimation(.easeInOut.delay(0.3)) {
                showViews[5] = true
            }
            
            withAnimation(.easeInOut.delay(0.35)) {
                showViews[6] = true
            }
        }
    }
}

//MARK: - Extensions

private extension String {
    static let changePtofileText = "Редактировать профиль"
    static let changeTreeText = "Редактировать дерево"
    static let synchonizeText = "Синхронизировать деревья"
    static let notificationText = "Уведомления"
    static let themeText = "Оформление"
    static let languageText = "Язык"
    static let chatText = "Чат поддержки"
    static let appText = "Возможности приложения"
    static let logOutText = "Выйти"
    static let deleteText = "Удалить аккаунт"
    
    static let changeIcon = "Pen"
    static let treeIcon = "Tree"
    static let globeIcon = "Globe"
    static let helpIcon = "Help-circle"
    static let messageIcon = "Message"
    static let bellIcon = "Bell"
    static let moonIcon = "Moon"
    static let logOutIcon = "LogOut"
    static let circleIcon = "XCircle"
}
