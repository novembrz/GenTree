//
//  TreeSynchronizationView.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 27.03.2023.
//

import SwiftUI

struct TreeSynchronizationView: View {
    
    @StateObject var viewModel = TreeSynchronizationViewModel()
    
    var body: some View {
        VStack(spacing: .spacing) {
            Image("Tree6")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: .imageWidth)
                .padding(.top, UIScreen.height / 4)
            
            Spacer()
            
            idView
        }
        .padding(.horizontal, Constants.horizontalInset)
        .padding(.bottom, Constants.bottomInset)
        .background(Color.background(), ignoresSafeAreaEdges: .all)
    }
    
    //MARK: - contentView
    
    var contentView: some View {
        Group {
            HStack {
                CustomTextField(
                    placeholder: .placeholder,
                    icon: .tree(),
                    editingText: $viewModel.editingText
                )
                
                IconButton(icon: .check(), color: .accent()) {
                    viewModel.mergedTree()
                }
            }
        }
    }
    
    //MARK: - idView
    
    var idView: some View {
        HStack(spacing: .textSpacing) {
            Text(String.yourId)
                .regular(.textSize)
                .foregroundColor(.text())
            
            Text("1345-261")
                .bold(.textSize)
                .foregroundColor(.text())
        }
    }
    
    //MARK: - loadingView
    
    var loadingView: some View {
        Text(viewModel.isUserAccept ? String.waiting : String.accept)
            .semiBold(18)
            .foregroundColor(.text())
            .padding(.horizontal, 36)
            .multilineTextAlignment(.center)
    }
}

//MARK: - Extension

private extension CGFloat {
    static let spacing: CGFloat = 42
    static let imageWidth: CGFloat = 182
    static let textSize: CGFloat = 14
    static let textSpacing: CGFloat = 13
}

private extension String {
    static let placeholder = "Введите id дерева"
    static let yourId = "ваш id:"
    static let waiting = "Подождите, деревья объединяются"
    static let accept = "Ждем подтверждение от владельца дерева"
}

//MARK: - Previews

struct TreeSynchronizationView_Previews: PreviewProvider {
    static var previews: some View {
        TreeSynchronizationView()
    }
}
