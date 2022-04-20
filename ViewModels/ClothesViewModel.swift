//
//  ClothesViewModel.swift
//  disso
//
//  Created by Nika Pakravan on 17/03/2022.
//

import Foundation

class ClothesViewModel: ObservableObject {
    @Published private(set) var closet: [Clothes] = []
    
    
    // this is where the data would be fetched from a database
    init() {
        closet = Clothes.all

    }
    
    func addClothes(clothes: Clothes) {
        closet.append(clothes)
    }
    
}


