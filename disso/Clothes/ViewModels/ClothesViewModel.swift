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
    
    @Published var closet = [Clothes]()
    
    func fetchClothes() {
        
        //reference to database
        let db = Firestore.firestore()
        
        // read documents from a specific path
        db.collection("clothes ").getDocuments { snapshot, error in
            
            //check for errors
            if error == nil {
                //no errors
                
                if let snapshot = snapshot {
                    
                    //update list in the main thread
                    DispatchQueue.main.async {
                        //get all documents and create clothing items
                        self.closet = snapshot.documents.map { d in
                            
                            //create a clothing item for each document 
                            return Clothes(name: d["name"] as? String ?? "",
                                           image: d["imgName"] as? String ?? "",
                                           colour: d["colour"] as? String ?? "",
                                           pattern: d["pattern"] as? String ?? "",
                                           category: d["category"] as? String ?? "")
                        }
                    }
                    
                }
            } else {
                
            }
            
        }
    }
    
    
    /*@Published private(set) var closet: [Clothes] = []
    
    
    func addClothes(clothes: Clothes) {
        closet.append(clothes)
    }
    
    init() {
        //fetchClothes()
        closet = Clothes.all
    }
    
    private var db = Firestore.firestore()
    
    func fetchClothes() {
            db.collection("clothes").addSnapshotListener { (querySnapshot, error) in
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
    }*/
    
}



