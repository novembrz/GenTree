//
//  AnimatedElement.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 26.03.2023.
//

import SwiftUI

public struct AnimatedElement: ViewModifier {
    
    var elementState: Bool
    var value: CGFloat = 250
    
    public func body(content: Content) -> some View {
        content
            .opacity(elementState ? 1 : 0)
            .offset(y: elementState ? 0 : value)
    }
}

extension View {
    public func animatingElement(_ shows: Bool, value: CGFloat) -> some View {
        self.modifier(AnimatedElement(elementState: shows, value: value))
    }
}
