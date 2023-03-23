//
//  TitleView.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 01.03.2023.
//

import SwiftUI

struct TitleView: View {
    let title: String
    var buttonTitle: String? = ""
    var action: (() -> ())? = nil
    var itemsCount: Int = 0
    
    var body: some View {
        HStack {
            Text(title)
                .font(.bold(.titleSize))
                .foregroundColor(.text())
            
            Spacer()
            
            if buttonTitle != "", let action = action, itemsCount > 1 {
                Button {
                    action()
                } label: {
                    Text(buttonTitle ?? "")
                        .font(.semiBold(.buttonTextSize))
                        .foregroundColor(.accent())
                }
            }
        }
    }
}

//MARK: - Extensions

private extension CGFloat {
    static let titleSize: CGFloat = 20
    static let buttonTextSize: CGFloat = 14
}

//MARK: - Previews

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "dd")
    }
}
