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
    
    
    /*private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("outfits").addSnapshotListener {(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("no documents")
                return
            }
            
            documents.map { (queryDocumentSnapshot) -> Outfits in
                let data = queryDocumentSnapshot.data()
                
                let outfitImage = data["image"]
                
                let outfit = Outfits(image: outfitImage as! UIImage)
                return outfit
            }
        }
    }*/
    
    
    
    init() {
        createdOutfits = Outfits.all

    }
    
    func addOutfit(outfits: Outfits) {
        createdOutfits.append(outfits)
    }
    

    
}

 
