//
//  PersonViewModel.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 26.02.2023.
//

import SwiftUI

extension PersonView {
    @MainActor class PersonViewModel: ObservableObject {
        @Published var lineNumber = 4
        @Published var showViews: [Bool] = Array(repeating: false, count: 5)
        
        //MARK: - mock
        var voiceItems = 1
        var galleryItems = ["avatar", "avatar", "avatar"]
        var biographyItems = [
            BiographyModel(icon: "Gift", title: "Родился в деревне Илькино", date: "2 Ноября 1999", description: "Белорусский метатель молота, чемпион мира, призёр Олимпийских игр и чемпионата Европы. Заслуженный мастер спорта Республики Беларусь. Выступал за «Динамо».  Европы. Заслуженный мастер спорта Республики Беларусь. Выступал за «Динамо»."),
            BiographyModel(icon: "Briefcase", title: "Пошел в школу", date: "1 Сентября 2006", description: "Белорусский метатель молота, чемпион мира, призёр Олимпийских игр и чемпионата Европы. Заслуженный мастер спорта Республ"),
            BiographyModel(icon: "Pods", title: "Стал брейкдансером", date: "13 Марта 2009", description: "Белорусский метатель")
        ]
        
        var biographyItems2 = [
            BiographyModel(icon: "Gift", title: "Родился в деревне Илькино", date: "2 Ноября 1999", description: "Белорусский метатель молота, чемпион мира, призёр Олимпийских игр и чемпионата Европы. Заслуженный мастер спорта Республики Беларусь. Выступал за «Динамо».  Европы. Заслуженный мастер спорта Республики Беларусь. Выступал за «Динамо»."),
        ]
        
        var kinItems: [PersonModel] = [
            PersonModel(avatarUrl: "avatar", fullname: "DDD", relationship: "ddd", birthDay: "ddd"),
            PersonModel(avatarUrl: "avatar", fullname: "DDD", relationship: "ddd", birthDay: "ddd"),
            PersonModel(avatarUrl: "avatar", fullname: "DDD", relationship: "ddd", birthDay: "ddd")
        ]
        
        func defols() {
            
        }
        
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
            
            withAnimation(.easeInOut.delay(0.35)) {
                showViews[4] = true
            }
        }
    }
}
