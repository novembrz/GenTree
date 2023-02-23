//
//  MainViewModel.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 23.02.2023.
//

import SwiftUI

extension MainView {
    @MainActor class MainViewModel: ObservableObject {
        
        @Published var selectedTab: Tab = .tree
        
    }
}
