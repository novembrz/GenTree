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
        ZStack(alignment: .top) {
            ScrollView {
                LazyVGrid(columns: viewModel.columns, spacing: .gridSpacing) {
                    ForEach(viewModel.family, id: \.self) { person in
                        FamilyCardView(person: person)
                            .animatingElement(viewModel.showViews[1], value: .evenValue)
                    }
                }
                .padding(.top, .topPadding)
                .padding(.bottom, Constants.bottomInset)
            }
            
            HStack(spacing: .searchSpacing) {
                SearchView(searchText: $viewModel.searchText)
                
                Button {} label: {
                    Image.filter()
                        .resizable()
                        .scaledToFit()
                        .frame(height: .imageHeight)
                        .padding(.horizontal, .imageHorizontal)
                        .padding(.vertical, .imageVertical)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(.radius)
                }
            }
            .animatingElement(viewModel.showViews[0], value: .evenValue)
        }
        .padding(.horizontal, Constants.horizontalInset)
        .background(Color.background())
        .onAppear(perform: viewModel.animateViews)
    }
    
    func aaa() -> Int {
        if viewModel.family.count > 8 {
           return 8
        } else {
            return viewModel.family.count
        }
    }
}

//MARK: - Extension

private extension CGFloat {
    static let topPadding: CGFloat = 70
    static let gridSpacing: CGFloat = 11
    static let searchSpacing: CGFloat = 9
    
    static let imageHorizontal: CGFloat = 12
    static let imageVertical: CGFloat = 15
    static let imageHeight: CGFloat = 18
    static let radius: CGFloat = 8
    
    static let evenValue: CGFloat = 100
    static let oddValue: CGFloat = 150
}

//MARK: - Previews

struct FamilyView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyView()
    }
}
