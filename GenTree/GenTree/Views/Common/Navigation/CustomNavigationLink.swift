//
//  CustomNavigationLink.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 27.03.2023.
//

import SwiftUI

struct CustomNavigationLink<Title: View, Destination: View>: View {
    
    private let destination: Destination
    private let title: Title?
    
    @Environment(\.dismiss) var dismiss
    
    init(@ViewBuilder title: () -> Title?, @ViewBuilder destination: () -> Destination) {
        self.title = title()
        self.destination = destination()
    }
    
    var body: some View {
        NavigationLink {
            ZStack(alignment: .topLeading) {
                destination
                
                Button {
                    withAnimation {
                        dismiss()
                    }
                } label: {
                    Image(systemName: .chevron)
                        .resizable()
                        .frame(width: .width, height: .height)
                        .foregroundColor(.text())
                        .padding(.leading, .leadingPadding)
                }
            }
            .navigationBarHidden(true)
        } label: {
            title
        }
    }
}

//MARK: - Extensions

private extension CGFloat {
    static let leadingPadding: CGFloat = 26
    static let height: CGFloat = 18
    static let width: CGFloat = 9
}

private extension String {
    static let chevron = "chevron.left"
}
