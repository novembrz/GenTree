//
//  SettingsViewModel.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 24.02.2023.
//

import SwiftUI

extension SettingsView {
    
    enum SettingsItem {
        case settings, editProfile, sinchronizeTrees
    }
    
    @MainActor class SettingsViewModel: ObservableObject {
        
        var fields: [SettingsItem] = [.settings, .editProfile, .sinchronizeTrees, .sinchronizeTrees]
        
        func title(field: SettingsItem) -> String {
            switch field {
            case .settings:
                return "Настройки"
            case .editProfile:
                return "Редактировать профиль"
            case .sinchronizeTrees:
                return "Синхронизировать деревья"
            }
        }
        
        func icon(field: SettingsItem) -> Image {
            switch field {
            case .settings:
                return .settings()
            case .editProfile:
                return .pen()
            case .sinchronizeTrees:
                return .tree()
            }
        }
        
        func logOut() {}
    }
}
