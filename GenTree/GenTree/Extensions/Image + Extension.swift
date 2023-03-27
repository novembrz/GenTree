//
//  Image + Extension.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 23.02.2023.
//

import SwiftUI

extension Image {
    
    struct Logo {
        
        static func apple() -> Image {
            return Image("appleLogo")
        }
        
        static func google() -> Image {
            return Image("googleLogo")
        }
        
        static func vk() -> Image {
            return Image("vkLogo")
        }
    }
    
    static func getImage(_ name: String) -> Image {
        return Image(name)
    }

    static func briefcase() -> Image {
        return Image("Briefcase")
    }

    static func check() -> Image {
        return Image("Check")
    }

    static func family() -> Image {
        return Image("Family")
    }

    static func filter() -> Image {
        return Image("Filter")
    }

    static func gift() -> Image {
        return Image("Gift")
    }

    static func key() -> Image {
        return Image("Key")
    }

    static func genTreeLogo() -> Image {
        return Image("GenTreeLogo")
    }

    static func liner() -> Image {
        return Image("Liner")
    }

    static func logOut() -> Image {
        return Image("LogOut")
    }

    static func mail() -> Image {
        return Image("Mail")
    }

    static func pen() -> Image {
        return Image("Pen")
    }

    static func play() -> Image {
        return Image("Play")
    }

    static func pods() -> Image {
        return Image("Pods")
    }

    static func search() -> Image {
        return Image("Search")
    }

    static func settings() -> Image {
        return Image("Settings")
    }

    static func treeLogo() -> Image {
        return Image("TreeLogo")
    }

    static func tree() -> Image {
        return Image("Tree")
    }

    static func user() -> Image {
        return Image("User")
    }

    static func x() -> Image {
        return Image("X")
    }

    static func xCircle() -> Image {
        return Image("XCircle")
    }
}
