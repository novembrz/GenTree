//
//  FamilyViewModel.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 23.02.2023.
//

import SwiftUI

extension FamilyView {
    @MainActor class FamilyViewModel: ObservableObject {
        
        @Published var showViews: [Bool] = Array(repeating: false, count: 2)
        @Published var searchText = ""
        
        var columns: [GridItem] = Array(repeating: .init(.flexible(minimum: 100), spacing: 11), count: 2)
        
        @Published var family: [PersonModel] = [PersonModel(
            avatarUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
            fullname: "Касыгина Мария Петровна",
            relationship: "Жена",
            birthDay: "1990"
        ), PersonModel(
            avatarUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
            fullname: "Девятовская Ярослава Николаевна",
            relationship: "Жена",
            birthDay: "1990"
        ), PersonModel(
            avatarUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
            fullname: "Касыгина Дарья Петровна",
            relationship: "Жена",
            birthDay: "1990"
        ),PersonModel(
            avatarUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
            fullname: "Касыгина Наталья Петровна",
            relationship: "Жена",
            birthDay: "1990"
        ), PersonModel(
            avatarUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
            fullname: "Касыгина Леопольд Петровна",
            relationship: "Жена",
            birthDay: "1990"
        ), PersonModel(
            avatarUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
            fullname: "Касыгинаdd Кузана Петровна",
            relationship: "Жена",
            birthDay: "1990"
        ), PersonModel(
            avatarUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
            fullname: "Касыгинdwwа Айкийля Петровна",
            relationship: "Жена",
            birthDay: "1990"
        ), PersonModel(
            avatarUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
            fullname: "Касыгинhgfа Варнава Петровна",
            relationship: "Жена",
            birthDay: "1990"
        )
        ]

        //MARK: - Animate
        
        func animateViews() {
            withAnimation(.easeInOut) {
                showViews[0] = true
            }
            
            withAnimation(.easeInOut.delay(0.15)) {
                showViews[1] = true
            }
        }
    }
}
