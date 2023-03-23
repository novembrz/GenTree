//
//  BiographyModel.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 23.03.2023.
//

import Foundation

struct BiographyModel: Decodable, Hashable {
    let icon: String
    let title: String
    let date: String
    let description: String
}
