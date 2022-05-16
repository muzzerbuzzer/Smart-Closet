//
//  ClothesView.swift
//  disso
//
//  Created by Nika Pakravan on 16/03/2022.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ClothesView: View {
    var clothes: Clothes
    @State private var name: String = ""
    @EnvironmentObject var clothesViewModel: ClothesViewModel
    //@ObservedObject private var viewModel = ClothesViewModel()
    
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: clothes.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            VStack (alignment: .leading, spacing: 30) {
                Text(clothes.name)
                    .font(.largeTitle)
                    .bold()
                    //.multilineTextAlignment(.left)
                    
                if !clothes.colour.isEmpty {
                    VStack(/*alignment: .leading,*/ spacing: 20) {
                        Text("Colour: \(clothes.colour)")
                            .font(.headline)

                    }
                }
                
                if !clothes.pattern.isEmpty {
                    VStack(/*alignment: .leading,*/ spacing: 20) {
                        Text("Pattern: \(clothes.pattern)")
                            .font(.headline)

                    }
                }

                if !clothes.category.isEmpty {
                    VStack(/*alignment: .leading,*/ spacing: 20) {
                        Text("Category: \(clothes.category)")
                            .font(.headline)

                    }
                }
                
            
                
                Button("Delete") {
                    //deleteItem()
                }
                

            }
            
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }
        /*.onAppear() {
            self.clothesViewModel.fetchClothes()
        }*/

    }
}

/*struct ClothesView_Previews: PreviewProvider {
    static var previews: some View {
        //ClothesView(clothes: Clothes.all[0])
    }
}*/

/*extension ClothesView {
    private func deleteItem(/*completion: @escaping (Bool) -> ()*/) {
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser?.uid
        //let ref = Firestore.firestore().reference().child("users").child(user!).child("clothes")
        
        db.collection("users").document(user!).collection("clothes").document(name).delete() /*{ error in
            if let error = error {
                print("error deleting document \(error.localizedDescription)")
                completion(false)
            } else {
                print("successfully deleted")
                completion(true)
            }
        }*/
    }
}*/
