//
//  SettingsView.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 23.02.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var viewModel = SettingsViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: .spacing) {
                    VStack(spacing: .elementSpacing) {
                        Circle()
                            .frame(width: .imageSize)
                            .padding(.top, .topPadding)
                        
                        Text("Курилова Д. К.")
                            .font(.bold(.titleFontSize))
                    }
                    
                    VStack(spacing: .elementSpacing) {
                        ForEach(viewModel.settingsFields, id: \.self) { item in
                            FieldButton(
                                title: item.title,
                                icon: .getImage(item.icon)
                            )
                        }
                    }
                    
                    Spacer()
                    
                    VStack(spacing: .elementSpacing) {
                        ForEach(viewModel.footerFields, id: \.self) { item in
                            FieldButton(
                                title: item.title,
                                icon: .getImage(item.icon),
                                color: item.color
                            )
                        }
                    }
                }
                .padding(.horizontal, Constants.horizontalInset)
                .padding(.bottom, Constants.bottomInset)
            }
            .background(Color.background())
        }
    }
}

//MARK: - Extension

private extension CGFloat {
    static let spacing: CGFloat = 48
    static let elementSpacing: CGFloat = 16
    static let imageSize: CGFloat = 115
    static let topPadding: CGFloat = 22
    static let titleFontSize: CGFloat = 24
}

private extension String {
//    static let logOut = "Выйти"
//    static let deleteAccount = "Удалить аккаунт"
}

//MARK: - Previews

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
