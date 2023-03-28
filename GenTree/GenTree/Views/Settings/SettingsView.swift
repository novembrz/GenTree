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
                    profileView
                    
                    VStack(spacing: .settingsSpacing) {
                        ListView(viewModel.changeProfileFields, animationIndex: 2)
                        ListView(viewModel.treeFields, animationIndex: 3)
                        ListView(viewModel.settingsFields, animationIndex: 4)
                        ListView(viewModel.helpFields, animationIndex: 5)
                        ListView(viewModel.footerFields, animationIndex: 6)
                    }
                }
                .padding(.horizontal, Constants.horizontalInset)
                .padding(.bottom, Constants.bottomInset)
            }
            .background(Color.background())
            .onAppear(perform: viewModel.animateViews)
        }
    }
    
    //MARK: - profileView
    
    var profileView: some View {
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
    }
    
    //MARK: - ListView
    
    @ViewBuilder
    func ListView(_ items: [SettingsView.SettingsItem], animationIndex: Int) -> some View {
        CustomNavigationLink {
            VStack(spacing: .elementSpacing) {
                ForEach(items, id: \.self) { item in
                    ListButton(
                        title: item.title,
                        icon: .getImage(item.icon),
                        color: item.color
                    )
                }
            }
            .animatingElement(viewModel.showViews[animationIndex], value: .evenValue)
        } destination: {
            TreeSynchronizationView()
        }
    }
}

//MARK: - Extension

private extension CGFloat {
    static let spacing: CGFloat = 48
    static let settingsSpacing: CGFloat = 35
    static let elementSpacing: CGFloat = 12
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
