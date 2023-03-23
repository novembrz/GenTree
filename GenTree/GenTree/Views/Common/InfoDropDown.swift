//
//  InfoDropDown.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 23.03.2023.
//

import SwiftUI

struct InfoDropDown: View {
    let icon: Image
    let title: String
    let subtitle: String
    let description: String
    
    @State var isTap = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: .horizontalSpacing) {
                SmallViewWithIcon(icon: icon)
                
                VStack(alignment: .leading, spacing: .verticalSpacing) {
                    Text(title)
                        .font(.semiBold(.titleFont))
                        .foregroundColor(.text())
                    
                    Text(subtitle)
                        .font(.medium(.textFont))
                        .foregroundColor(.accent())
                }
                
                Spacer()
                
                Image(systemName: .chevronDown)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: .imageHeight)
                    .foregroundColor(.text())
                    .rotationEffect(.degrees(isTap ? 180 : 0))
                    .animation(.linear, value: isTap)
            }
            
            if isTap {
                Text(description)
                    .foregroundColor(.text())
                    .font(.regular(.textFont))
                    .lineSpacing(.lineSpacing)
                    .padding(.top, .topPading)
                    .padding(.leading, .leadingPaddding)
            }
        }
        .onTapGesture {
            withAnimation(.easeIn) {
                isTap.toggle()
            }
        }
    }
}

//MARK: - Extensions

private extension CGFloat {
    static let horizontalSpacing: CGFloat = 16
    static let verticalSpacing: CGFloat = 2
    static let titleFont: CGFloat = 15
    static let textFont: CGFloat = 12
    static let imageHeight: CGFloat = 12
    static let leadingPaddding: CGFloat = 48
    static let lineSpacing: CGFloat = 4
    static let topPading: CGFloat = 5
}

private extension String {
    static let chevronDown = "chevron.down"
    static let chevronUp = "chevron.up"
}

//MARK: - Previews

struct InfoDropDown_Previews: PreviewProvider {
    static var previews: some View {
        InfoDropDown(icon: Image.family(), title: "Family", subtitle: "12 September 1998", description: "September 1998September 1998September 1998September 1998September 1998September 1998September 1998September 1998September 1998September 1998")
    }
}
