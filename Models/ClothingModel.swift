//
//  ClothingModel.swift
//  disso
//
//  Created by Nika Pakravan on 16/03/2022.
//

import Foundation
import UIKit

enum Category: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    case bag = "Bag"
    case blouse = "Blouse"
    case bodysuit = "Bodysuit"
    case bra = "Bra"
    case cardigan = "Cardigan"
    case coat = "Coat"
    case corset = "Corset"
    case dress = "Dress"
    case hoodie = "Hoodie"
    case jacket = "Jacket"
    case jeans = "Jeans"
    case jumper = "Jumper"
    case jumpsuit = "Jumpsuit"
    case leggings = "Leggings"
    case other = "Other"
    case overalls = "Overalls"
    case panties = "Panties"
    case pants = "Pants"
    case playsuit = "Playsuit"
    case pyjamas = "Pyjamas"
    case shawl = "Shawl"
    case shoes = "Shoes"
    case shirt = "Shirt"
    case shorts = "Shorts"
    case skirt = "Skirt"
    case skort = "Skort"
    case socks = "Socks"
    case sweater = "Sweater"
    case swimsuit = "Swimsuit"
    case tie = "Tie"
    case tights = "Tights"
    case tracksuit = "Tracksuit"
    
}

enum Colour: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    case red = "Red"
    case orange = "Orange"
    case yellow = "Yellow"
    case green = "Green"
    case blue = "Blue"
    case indigo = "Indigo"
    case violet = "Violet"
    case pink = "Pink"
    case white = "White"
    case black = "Black"
    
}

struct Clothes: Identifiable {
    let id = UUID()
    let name: String
    let image: UIImage
    let colour: Colour.RawValue
    let pattern: String
    let category: Category.RawValue
    let dateAdded: String
}

extension Clothes {
    static let all: [Clothes] = [
        /*Clothes(
            name: "Flower Corset",
            //image: "https://i.pinimg.com/474x/da/17/14/da1714131be5faab9eaffb63160a8d29.jpg",
            colour: "Multicolour",
            pattern: "Floral",
            category: "Corset",
            dateAdded: "2022-16-03"
        ),
        Clothes(
            name: "Wide-Leg Light-Wash Jeans",
            //image: "https://assetsprx.matchesfashion.com/img/product/920/1364600_1.jpg",
            colour: "Light Blue",
            pattern: "Jean",
            category: "Jeans",
            dateAdded: "2022-16-03"
        ),
        Clothes(
            name: "Platform Converse",
            //image: "https://www.converse.com/dw/image/v2/AALW_PRD/on/demandware.static/-/Sites-ConverseMaster/default/dwecab2c34/images/a_107/560846C_A_107X1.jpg?sw=2000",
            colour: "White",
            pattern: "Plain",
            category: "Shoes",
            dateAdded: "2022-16-03"
        ),
        Clothes(
            name: "The New Yorker Tote",
            //image: "https://pictures.depop.com/b0/7092085/371707248_vQt0PR5IOG/P0.jpg",
            colour: "White",
            pattern: "Letters",
            category: "Bag",
            dateAdded: "2022-16-03"
        )*/
    ]
}
