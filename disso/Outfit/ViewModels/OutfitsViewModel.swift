//
//  OutfitsViewMode.swift
//  disso
//
//  Created by Nika Pakravan on 28/04/2022.
//

//view model for outfits
/* The code's logic for fetching the clothes is from Firebase's YouTube Channel.
 Everything else is written by me*/
import Foundation
import Firebase
import FirebaseAuth

class OutfitsViewModel: ObservableObject {
    
    //outfits array
    @Published private(set) var createdOutfits: [Outfits] = []
    
    
    //initialises to fetch clothes
    init() {
        fetchOutfits()

    }
    
    
    func addOutfit(outfits: Outfits) {
        createdOutfits.append(outfits)
    }
    
    //fetching clothes from Firestore. Code from Firebase YouTube Channel (Firebase SDK)
    private var db = Firestore.firestore()
    
    func fetchOutfits() {
        let user = Auth.auth().currentUser?.uid
        
        if user != nil {
        
        db.collection("users").document(user!).collection("outfits").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }

                self.createdOutfits = documents.map { (queryDocumentSnapshot) -> Outfits in
                    let data = queryDocumentSnapshot.data()
                    
                    //outfit image in the collection
                    let outfitImage = data["outfitLink"] as? String ?? ""
                    
                    return Outfits(image: outfitImage)

                }
            }
        }
    }
    
}

 
