//
//  MainView.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 23.02.2023.
//

import SwiftUI

struct MainView: View {

    @StateObject var viewModel = MainViewModel()
    @GestureState var gestureOffset: CGFloat = 0

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        NavigationView {
            HStack(spacing: 0) {
                tabBar
            }
        }
    }

    //MARK: - TabBar
    
    var tabBar: some View {
        ZStack {
            VStack {
                TabView(selection: $viewModel.selectedTab) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        CurrentView()
                            .animation(nil, value: viewModel.selectedTab)
                            .tag(tab)
                    }
                }
            }

            VStack {
                Spacer()
                CustomTabBar(selectedTab: $viewModel.selectedTab)
            }
        }
    }

    //MARK: - ViewBuilder

    @ViewBuilder
    private func CurrentView() -> some View {
        switch viewModel.selectedTab {
        case .tree:
            TreeView()
        case .family:
            FamilyView()
        case .settings:
            SettingsView()
        }
    }
}

//MARK: - Extensions

private extension CGFloat {
    static let titleFontSize: CGFloat = 35
}

//MARK: - Previews

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

