//
//  LinearGradient.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 26.03.2023.
//

import SwiftUI

extension LinearGradient {
    public static var horizontalGradient = LinearGradient(colors: [.greenColor(), .lightGreenColor()], startPoint: .leading, endPoint: .trailing)
    
    public static var diagonalGradient = LinearGradient(colors: [.greenColor(), .lightGreenColor()], startPoint: .topLeading, endPoint: .bottomTrailing)
}
