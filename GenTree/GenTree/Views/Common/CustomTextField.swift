//
//  CustomTextField.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 26.03.2023.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    let icon: Image
    @Binding var editingText: String
    
    var body: some View {
        HStack {
            icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: .iconHeight)
                .foregroundColor(editingText == "" ? .text().opacity(.opacity) : .text())
            
            TextField(placeholder, text: $editingText)
                .regular(.placeholderSize)
                .foregroundColor(.text())
        }
        .frame(height: .height)
        .padding(.horizontal, .horizontalPadding)
        .background(Color.element())
        .cornerRadius(.radius)
    }
}

//MARK: - Extension

private extension CGFloat {
    static let iconHeight: CGFloat = 11
    static let placeholderSize: CGFloat = 13
    static let height: CGFloat = 45
    static let horizontalPadding: CGFloat = 15
    static let radius: CGFloat = 15
}

private extension Double {
    static let opacity: Double = 0.3
}

//MARK: - Preview

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
