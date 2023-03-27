//
//  TreeSynchronizationViewModel.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 27.03.2023.
//

import SwiftUI

extension TreeSynchronizationView {
    
    enum PageState {
        case content, checkingUserAccept, merge, done
    }
    
    @MainActor class TreeSynchronizationViewModel: ObservableObject {
        @Published var editingText = ""
        @Published var isLoading = false
        @Published var isUserAccept = false
        @Published var isMerged = false
        
        @Published var pageState: PageState = .content
        
        func mergedTree() { //яр до этого проверил есть ли айди
            Task {
                try? await fetchData()
            }
        }
        
        @MainActor
        private func fetchData() async throws {
            isLoading.toggle()
            
            if isLoading {
                sleep(5) // запрашиваем разрешение на объединение
                isUserAccept = true
                sleep(2) // oбъединяем
                isMerged = true
            }
        }
    }
}
