//
//  AuthViewModel.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 26.03.2023.
//

import SwiftUI

extension AuthView {
    @MainActor class AuthViewModel: ObservableObject {
        @Published var loginText: String = ""
        @Published var emailText: String = ""
        @Published var passwordText: String = ""
        @Published var confirmPasswordText: String = ""
        
        @Published var isRegisterPage = false
        
        func switchPage() {
            isRegisterPage.toggle()
        }
    }
}
