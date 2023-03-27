//
//  CustomNavigationView.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 27.03.2023.
//

import SwiftUI

struct CustomNavigationView<Content: View>: View {
    
    private let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

//MARK: - Previews

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView {
            VStack(spacing: .spacing) {
                Text(String.pageTitile)
                
                CustomNavigationLink {
                    Text(String.tapText)
                } destination: {
                    ScrollView(.vertical, showsIndicators: false) {
                        Text(String.destinationText)
                            .padding(.top, .topPadding)
                    }
                }
            }
        }
    }
}

//MARK: - Extension

private extension CGFloat {
    static let topPadding: CGFloat = 40
    static let spacing: CGFloat = 40
}

private extension String {
    static let destinationText = "Destination View Controller"
    static let tapText = "Tap"
    static let pageTitile = "Home page"
}
