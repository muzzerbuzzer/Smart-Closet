//
//  OutfitsViewMode.swift
//  disso
//
//  Created by Nika Pakravan on 28/04/2022.
//

import Foundation

class OutfitsViewModel: ObservableObject {
    @Published private(set) var createdOutfits: [Outfits] = []
    
    init() {
        createdOutfits = Outfits.all

    }
    
    func addOutfit(outfits: Outfits) {
        createdOutfits.append(outfits)
    }
    
}

 
