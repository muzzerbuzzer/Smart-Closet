//
//  ClothingCard.swift
//  disso
//
//  Created by Nika Pakravan on 16/03/2022.
//

//clothing card for main view
/*Most of this is from DesignCode's "Build a Recipe App from scratch with SwiftUI - Part 1", as well as part 2
 Only some aspects are removed
 Values have been re-named to fit the applications needs
 Those codes are by me*/
import SwiftUI
import Photos
import PhotosUI
import Firebase
import FirebaseAuth

struct ClothingCard: View {
    var clothes: Clothes
    
    var body: some View {
        VStack {
            
            AsyncImage(url: URL(string: clothes.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .frame(width: 160, height: 217, alignment: .center)
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
        }
        .frame(width: 160, height: 217, alignment: .top)
    }
}


