//
//  ClothesViewModel.swift
//  disso
//
//  Created by Nika Pakravan on 17/03/2022.
//

import Foundation
import Firebase
import FirebaseAuth

class ClothesViewModel: ObservableObject {
    
    @Published private(set) var closet: [Clothes] = []
    
    func addClothes(clothes: Clothes) {
        closet.append(clothes)
    }
    
    init() {
        fetchClothes()
        //closet = Clothes.all
    }
    
    private var db = Firestore.firestore()
    
    func fetchClothes() {
        let user = Auth.auth().currentUser?.uid
        
        db.collection("users").document(user!).collection("clothes").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }

                self.closet = documents.map { (queryDocumentSnapshot) -> Clothes in
                    let data = queryDocumentSnapshot.data()
                    
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



