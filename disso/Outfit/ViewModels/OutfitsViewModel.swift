//
//  OutfitsViewMode.swift
//  disso
//
//  Created by Nika Pakravan on 28/04/2022.
//

import Foundation
import Firebase

class OutfitsViewModel: ObservableObject {
    @Published private(set) var createdOutfits: [Outfits] = []
    
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("outfits")
    }
    
    
    
    /*init() {
        createdOutfits = Outfits.all

    }
    
    func addOutfit(outfits: Outfits) {
        createdOutfits.append(outfits)
    }*/
    

    
}

 
