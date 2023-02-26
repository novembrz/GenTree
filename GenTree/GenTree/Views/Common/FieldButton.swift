//
//  FieldButton.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 24.02.2023.
//

import SwiftUI

struct FieldButton: View {
    let title: String
    let icon: Image
    var color: Color? = .text()
    
    var body: some View {
        HStack(spacing: .spacing) {
            icon
                .resizable()
                .scaledToFit()
                .frame(width: .iconWidth)
                .foregroundColor(color)
            
            Text(title)
                .foregroundColor(color)
                .font(.medium(.textSize))
            
            Spacer()
        }
        .padding(.vertical, .verticalPadding)
        .padding(.horizontal, .horizontalPadding)
        .background(Color.element())
        .cornerRadius(.corner)
    }
}

//MARK: - Extensions

private extension CGFloat {
    static let spacing: CGFloat = 14
    static let iconWidth: CGFloat = 18
    static let textSize: CGFloat = 16
    static let verticalPadding: CGFloat = 14
    static let horizontalPadding: CGFloat = 17
    static let corner: CGFloat = 15
}

//MARK: - PreviewProvider

struct FieldButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
