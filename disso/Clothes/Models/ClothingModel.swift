//
//  ClothingModel.swift
//  disso
//
//  Created by Nika Pakravan on 16/03/2022.
//

//clothing item model
/*This code's logic is from DesignCode's "Build a Recipe App from scratch with SwiftUI - Part 1", as well as part 2
 Actual code is written by me*/
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
    case brown = "Brown"
    case white = "White"
    case black = "Black"
    
}

struct Clothes: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let colour: Colour.RawValue
    let pattern: String
    let category: Category.RawValue
}

extension Clothes {
    static let all: [Clothes] = [

    ]
}
