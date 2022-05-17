//
//  ClothesViewModel.swift
//  disso
//
//  Created by Nika Pakravan on 17/03/2022.
//

//view model for clothing items
/* The code's logic for fetching the clothes is from Firebase's YouTube Channel.
 Everything else is written by me*/
import Foundation
import Firebase
import FirebaseAuth

class ClothesViewModel: ObservableObject {
    
    //clothes array
    @Published private(set) var closet: [Clothes] = []
    
    func addClothes(clothes: Clothes) {
        closet.append(clothes)
    }
    
    //initialises to fetch the clothes
    init() {
        fetchClothes()
    }
    
    private var db = Firestore.firestore()
    
    //fetching clothes from Firestore. Code from Firebase YouTube Channel (Firebase SDK)
    func fetchClothes() {
        let user = Auth.auth().currentUser?.uid
        
        if user != nil {
        
        db.collection("users").document(user!).collection("clothes").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }

                self.closet = documents.map { (queryDocumentSnapshot) -> Clothes in
                    let data = queryDocumentSnapshot.data()
                    
                    //all items in the collection
                    let name = data["name"] as? String ?? ""
                    let clothingImage = data["imgName"] as? String ?? ""
                    let colour = data["colour"] as? String ?? ""
                    let pattern = data["pattern"] as? String ?? ""
                    let category = data["category"] as? String ?? ""
                    
                    return Clothes(name: name, image: clothingImage, colour: colour, pattern: pattern, category: category)

                }
            }
        }
    }
    
}



