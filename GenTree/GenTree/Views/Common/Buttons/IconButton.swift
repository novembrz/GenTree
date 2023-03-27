//
//  IconButton.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 27.03.2023.
//

import SwiftUI

struct IconButton: View {
    let icon: Image
    let color: Color
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            icon
                .resizable()
                .scaledToFit()
                .frame(height: .imageHeight)
                .padding(.horizontal, .imageHorizontal)
                .padding(.vertical, .imageVertical)
                .foregroundColor(.white)
                .background(color)
                .cornerRadius(.radius)
        }
    }
}

//MARK: - Extensions

private extension CGFloat {
    static let imageHorizontal: CGFloat = 12
    static let imageVertical: CGFloat = 15
    static let imageHeight: CGFloat = 18
    static let radius: CGFloat = 8
}

//MARK: - PreviewProvider

struct IconButton_Previews: PreviewProvider {
    static var previews: some View {
        IconButton(icon: .filter(), color: .accent()) {}
    }
}
