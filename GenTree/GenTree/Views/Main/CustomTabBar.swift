//
//  CustomTabBar.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 23.02.2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case tree = "Tree"
    case family = "Family"
    case settings = "Settings"
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    
                    Image(selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(selectedTab == tab ? .scaleTabEffect : .scaleEffect)
                        .foregroundColor(selectedTab == tab ? .accent() : .gray)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: .duration)) {
                                selectedTab = tab
                            }
                        }
                    
                    Spacer()
                }
            }
            .frame(width: nil, height: Constants.tabBarHeight)
            .background(Color.element())
            .cornerRadius(.cornerRadius)
            .padding(.horizontal, .horizontal)
        }
    }
}


//MARK: - Previews

private extension CGFloat {
    static let cornerRadius: CGFloat = 10
    static let scaleTabEffect: CGFloat = 1.25
    static let scaleEffect: CGFloat = 1.0
    static let horizontal: CGFloat = 30
}

private extension Double {
    static let duration: CGFloat = 0.1
}

//MARK: - Previews

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

