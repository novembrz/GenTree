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
        HStack(spacing: .spacing) {
            Image.search()
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: .width)
                .foregroundColor(.secondText())
            
            TextField(String.placeholder, text: $searchText)
                .foregroundColor(.text())
        }
        .padding(.padding)
        .background(Color.element())
        .cornerRadius(.cornerRadius)
    }
}

//MARK: - Extension

private extension String {
    static let placeholder = "Найти"
}

private extension CGFloat {
    static let spacing: CGFloat = 10
    static let width: CGFloat = 14
    static let padding: CGFloat = 14
    static let cornerRadius: CGFloat = 10
}

//MARK: - Previews

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyView()
    }
}
