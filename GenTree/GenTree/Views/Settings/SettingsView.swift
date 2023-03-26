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
                        Image("avatar")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: .imageSize, height: .imageSize)
                            .clipShape(Circle())
                            .padding(.top, .topPadding)
                            .opacity(viewModel.showViews[0] ? 1 : 0)
                            .rotationEffect(.degrees(viewModel.showViews[0] ? 0 : .degrees))
                        
                        Text("Курилова Д. К.")
                            .bold(.titleFontSize)
                            .foregroundColor(.text())
                            .animatingElement(viewModel.showViews[1], value: .oddValue)
                    }
                    
                    VStack(spacing: .elementSpacing) {
                        ForEach(viewModel.settingsFields, id: \.self) { item in
                            FieldButton(
                                title: item.title,
                                icon: .getImage(item.icon)
                            )
                        }
                    }
                    .animatingElement(viewModel.showViews[2], value: .evenValue)
                    
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
                    .animatingElement(viewModel.showViews[3], value: .oddValue)
                }
                .padding(.horizontal, Constants.horizontalInset)
                .padding(.bottom, Constants.bottomInset)
            }
            .background(Color.background())
            .onAppear(perform: viewModel.animateViews)
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
    
    static let evenValue: CGFloat = 100
    static let oddValue: CGFloat = 150
}

private extension Double {
    static let degrees: Double = 90
}

//MARK: - Previews

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
