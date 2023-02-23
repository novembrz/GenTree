//
//  Font + Extension.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 23.02.2023.
//

import SwiftUI

extension Font {
    
    static func regular(_ size: CGFloat) -> Font {
        return Font.custom("Montserrat-Regular", size: size)
    }
    
    static func medium(_ size: CGFloat) -> Font {
        return Font.custom("Montserrat-Medium", size: size)
    }
    
    static func semiBold(_ size: CGFloat) -> Font {
        return Font.custom("Montserrat-SemiBold", size: size)
    }
    
    static func bold(_ size: CGFloat) -> Font {
        return Font.custom("Montserrat-Bold", size: size)
    }
}
