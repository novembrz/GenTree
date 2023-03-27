//
//  SmallViewWithIcon.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 23.03.2023.
//

import SwiftUI

struct SmallViewWithIcon: View {
    let icon: Image
    
    var body: some View {
            icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: .iconHeight)
                .foregroundColor(.text())
                .frame(width: .viewSize, height: .viewSize)
                .background(Color.element())
                .cornerRadius(.cornerRadius)
    }
}

//MARK: - Extensions

private extension CGFloat {
    static let viewSize: CGFloat = 32
    static let iconHeight: CGFloat = 14
    static let cornerRadius: CGFloat = 5
}

//MARK: - Previews

struct SmallViewWithIcon_Previews: PreviewProvider {
    static var previews: some View {
        SmallViewWithIcon(icon: Image.family())
            .frame(width: 100, height: 100)
            .background(Color.red)
    }
}
