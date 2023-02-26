//
//  FamilyCardView.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 23.02.2023.
//

import SwiftUI

struct FamilyCardView: View {
    
    let person: PersonModel
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("avatar")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: height())
                .cornerRadius(.cornerRadius)
            
            Image.liner()
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(.cornerRadius)
            
            VStack(alignment: .leading, spacing: .spacing) {
                Text(person.fullname)
                    .font(.bold(.nameFontSize))
                    .foregroundColor(.white)
                
                Text(person.birthDay)
                    .font(.medium(.dateFontSize))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, .horizontal)
            .padding(.bottom, .bottom)
        }
    }
    
    func height() -> CGFloat {
        let width = UIScreen.width/2 - Constants.horizontalInset*2 - 11
        return width * 1.45
    }
}

//MARK: - Extensions

private extension CGFloat {
    static let cornerRadius: CGFloat = 10
    static let nameFontSize: CGFloat = 13
    static let dateFontSize: CGFloat = 12
    static let horizontal: CGFloat = 9
    static let bottom: CGFloat = 14
    static let spacing: CGFloat = 5
}

//MARK: - Previews

struct FamilyCardView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyView()
    }
}
