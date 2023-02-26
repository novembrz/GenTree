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
                    ForEach(viewModel.fields, id: \.self) { item in
                        FieldButton(
                            title: viewModel.title(field: item),
                            icon: viewModel.icon(field: item)
                        )
                    }
                }
                
                Spacer()
                
                VStack(spacing: .elementSpacing) {
                    FieldButton(title: .logOut, icon: .logOut())
                    FieldButton(title: .deleteAccount, icon: .xCircle(), color: .dangerous())
                }
            }
            .padding(.horizontal, Constants.horizontalInset)
        }
        .background(Color.background())
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
    static let logOut = "Выйти"
    static let deleteAccount = "Удалить аккаунт"
}

//MARK: - Previews

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
