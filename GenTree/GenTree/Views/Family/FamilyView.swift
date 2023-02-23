//
//  FamilyView.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 23.02.2023.
//

import SwiftUI

struct FamilyView: View {
    @StateObject var viewModel = FamilyViewModel()
    
    var body: some View {
        ScrollView {
            HStack(spacing: .spacing) {
                ForEach(viewModel.family, id: \.self) { person in
                    FamilyCardView(person: person)
                }
            }
            .padding(.horizontal, .Constants.horizontal)
        }
    }
}

//MARK: - Extension

private extension CGFloat {
    static let spacing: CGFloat = 11
}


//MARK: - Previews

struct FamilyView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyView()
    }
}
