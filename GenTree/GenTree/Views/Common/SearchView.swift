//
//  SearchView.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 26.02.2023.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image.search()
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 14)
                .foregroundColor(.secondText())
            
            TextField("Найти", text: $searchText)
                .foregroundColor(.text())
        }
        .padding(14)
        .background(Color.element())
        .cornerRadius(10)
    }
}

//MARK: - Previews

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyView()
    }
}
