//
//  PersonModel.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 23.02.2023.
//

import Foundation

struct PersonModel: Decodable, Hashable {
    let avatarUrl: String
    let fullname: String //  будет потом пофамильно, разбей на 3
    let relationship: String //role
    let birthDay: String
}
