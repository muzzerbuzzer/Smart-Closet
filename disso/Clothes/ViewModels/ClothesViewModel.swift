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
    
    init() {
        closet = Clothes.all

    }
    
    func addClothes(clothes: Clothes) {
        closet.append(clothes)
    }
    
    private var db = Firestore.firestore()
    
    func getAllData(clothes: Clothes) {
            db.collection("clothes").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }

                self.closet = documents.map { (queryDocumentSnapshot) -> Clothes in
                    let data = queryDocumentSnapshot.data()
                    let name = data["name"] as? String ?? ""
                    let imgN = data["imgName"] as? UIImage
                    let colour = data["colour"] as? String ?? ""
                    let pattern = data["pattern"] as? String ?? ""
                    let category = data["category"] as? String ?? ""
                    //let dateAdded = data["dateAdded"] as? String ?? ""
                    
                    return Clothes(name: name, image: imgN!, colour: colour, pattern: pattern, category: category/*, dateAdded: dateAdded*/)
                }
            }
    }
    
}



