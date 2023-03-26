//
//  AuthView.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 26.03.2023.
//

import SwiftUI

struct AuthView: View {
    @StateObject var viewModel = AuthViewModel()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Image.genTreeLogo()
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: .avatarHeight)
                .padding(.top, .imageTopPadding)
                .padding(.bottom, .imageBottomPadding)
            
            VStack(spacing: .buttonSpacing) {
                VStack(alignment: .trailing, spacing: .forgotPasswordSpacing) {
                    fieldsView
                    forgotPasswordView
                }
                
                buttonView
            }
            
            Spacer()
            
            VStack(spacing: .switchPagePadding) {
                authMethodButtonsView
                switchPageView
            }
        }
        .padding(.horizontal, Constants.horizontalInset)
        .background(Color.background())
    }
    
    //MARK: - fieldsView
    
    var fieldsView: some View {
        VStack(spacing: .fieldsSpacing) {
            if viewModel.isRegisterPage {
                CustomTextField(placeholder: .mail, icon: .mail(), editingText: $viewModel.emailText)
            }
            
            CustomTextField(placeholder: .login, icon: .user(), editingText: $viewModel.loginText)
            
            CustomTextField(placeholder: .password, icon: .key(), editingText: $viewModel.passwordText)
            
            if viewModel.isRegisterPage {
                CustomTextField(placeholder: .confirmPassword, icon: .key(), editingText: $viewModel.confirmPasswordText)
            }
        }
    }
    
    //MARK: - forgotPasswordView
    
    var forgotPasswordView: some View {
        Group {
            if !viewModel.isRegisterPage {
                Button {} label: {
                    Text(String.forgotPassword)
                        .medium(.forgotPasswordText)
                        .foregroundColor(.text())
                }
            }
        }
    }
    
    //MARK: - buttonView
    
    var buttonView: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            ZStack {
                LinearGradient.horizontalGradient
                    .cornerRadius(.cornerRadius)
                    .frame(height: .buttonHeigth)
                
                Text(viewModel.isRegisterPage ? String.continueRegister : String.signIn)
                    .medium(.buttonTextSize)
                   .foregroundColor(.white)
                
                HStack {
                    if viewModel.isRegisterPage {
                        Spacer()
                        
                        Image(systemName: .chevron)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: .chevronHeight)
                            .padding(.trailing, .chevronPadding)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
    
    //MARK: - authMethodButtonsView
    
    var authMethodButtonsView: some View {
        HStack(spacing: .switchPagePadding) {
            CircleButton(icon: .Logo.google(), color: .white)
            CircleButton(icon: .Logo.apple(), color: .black)
            CircleButton(icon: .Logo.vk(), color: .blue)
        }
    }
    
    @ViewBuilder
    func CircleButton(icon: Image, color: Color) -> some View {
        ZStack {
            Circle()
                .frame(height: 45)
                .foregroundColor(color)
            
            icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 25)
        }
    }
    
    //MARK: - switchPageView
    
    var switchPageView: some View {
        Button {
            withAnimation {
                viewModel.switchPage()
            }
        } label: {
            HStack(spacing: .switchSpacing) {
                Text(viewModel.isRegisterPage ? String.needAccount : String.noAccount)
                    .regular(.switchPageText)
                    .foregroundColor(.text().opacity(.opacity))
                
                Text(viewModel.isRegisterPage ? String.signInTitle : String.register)
                    .regular(.switchPageText)
                    .foregroundColor(.text())
            }
        }
        .padding(.bottom, .switchPageBottom)
    }
}

//MARK: - Extension

private extension Double {
    static let opacity: Double = 0.4
}

private extension CGFloat {
    static let imageBottomPadding: CGFloat = 60
    static let imageTopPadding: CGFloat = UIScreen.height*0.11
    static let avatarHeight: CGFloat = 98
    
    static let fieldsSpacing: CGFloat = 12
    static let forgotPasswordSpacing: CGFloat = 14
    static let forgotPasswordText: CGFloat = 13
    
    static let buttonSpacing: CGFloat = 53
    
    static let buttonTextSize: CGFloat = 16
    static let buttonHeigth: CGFloat = 45
    static let buttonWidth: CGFloat = UIScreen.width-Constants.horizontalInset*2
    static let cornerRadius: CGFloat = 15
    
    static let chevronHeight: CGFloat = 16
    static let chevronPadding: CGFloat = 15
    
    static let switchSpacing: CGFloat = 12
    static let switchPageText: CGFloat = 16
    static let switchPageBottom: CGFloat = 20
    
    static let switchPagePadding: CGFloat = 25
}

private extension String {
    static let login = "логин"
    static let mail = "почта"
    static let confirmPassword = "повторите пароль"
    static let password = "пароль"
    static let forgotPassword = "забыли пароль?"
    static let noAccount = "Нет аккаунта?"
    static let needAccount = "Есть аккаунт?"
    static let register = "Зарегестрируйся"
    static let signInTitle = "Войдите"
    static let signIn = "Войти"
    static let continueRegister = "Продолжить"
    static let chevron = "chevron.right"
}

//MARK: - Preview

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
