//
//  ClothesViewModel.swift
//  disso
//
//  Created by Nika Pakravan on 17/03/2022.
//

import Foundation
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase

class ClothesViewModel: ObservableObject {
    @Published private(set) var closet: [Clothes] = []
    
    /*private var databasePath: DatabaseReference? = {
        //gets user ID of current authenticated user
        guard let uid = Auth.auth().currentUser?.uid else {
            return nil
        }
        
        //returns a referenc to the path in the database where the data is stored
        let ref = Database.database()
            .reference()
            .child("users/\(uid)/clothes")
        return ref
    }()

    //defines an encoder variable to encode JSON data
    private let encoder = JSONEncoder()
    
    
    init() {
        closet = Clothes.all

    }
    
    func addClothes(clothes: Clothes) {
        // previously defined databasePath
        guard let databasePath = databasePath else {
            return
        }
        
        //returns immediately if theres nothing to post to the database
        if closet.isEmpty {
            return
        }
        
        do {
            //encodes the Clothes model into JSON data
            let data = try encoder.encode(Clothes)
            
            //converts the JSON data into a JSON dictionary
            let json = try JSONSerialization.jsonObject(with: data)
            
            //writes the dictionary to the database path as a child node with an automatically generated ID
            databasePath.childByAutoId()
                .setValue(json)
        } catch {
            print("an error occured", error)
        }
    }*/
    
    func addClothes(clothes: Clothes) {
        closet.append(clothes)
    }
    
}


