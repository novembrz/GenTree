//
//  AuthView.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 26.03.2023.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        VStack {
            Image.genTreeLogo()
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 98)
            
            
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
