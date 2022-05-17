//
//  ClothesView.swift
//  disso
//
//  Created by Nika Pakravan on 16/03/2022.
//

//individual clothes view
/*This code's logic is from DesignCode's "Build a Recipe App from scratch with SwiftUI - Part 1", as well as part 2
 Rest of the code is written by me*/
import SwiftUI
import Firebase
import FirebaseAuth

struct ClothesView: View {
    var clothes: Clothes
    @State private var name: String = ""
    @EnvironmentObject var clothesViewModel: ClothesViewModel

    
    var body: some View {
        ScrollView {
            //from DesignCode
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
                    
                if !clothes.colour.isEmpty {
                    VStack(spacing: 20) {
                        Text("Colour: \(clothes.colour)")
                            .font(.headline)

                    }
                }
                
                if !clothes.pattern.isEmpty {
                    VStack(spacing: 20) {
                        Text("Pattern: \(clothes.pattern)")
                            .font(.headline)

                    }
                }

                if !clothes.category.isEmpty {
                    VStack(spacing: 20) {
                        Text("Category: \(clothes.category)")
                            .font(.headline)

                    }
                }
                
            
                Button("Delete") {
                    //deleteItem()
                }
                

            }
            
            //from DesignCode
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }

    }
}

