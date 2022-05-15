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
    
    
    init() {
        createdOutfits = Outfits.all

    }
    
    func addOutfit(outfits: Outfits) {
        createdOutfits.append(outfits)
    }
    
    private var db = Firestore.firestore()
    
    func fetchOutfits() {
        let user = Auth.auth().currentUser?.uid
        
        db.collection("users").document(user!).collection("clothes").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }

                self.createdOutfits = documents.map { (queryDocumentSnapshot) -> Outfits in
                    let data = queryDocumentSnapshot.data()
                    
                    let outfitImage = data["outfitLink"] as? String ?? ""
                    
                    return Outfits(image: outfitImage)

                }
            }
    }
    
}

 
