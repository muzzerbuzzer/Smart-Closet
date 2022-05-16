//
//  ClothingCard.swift
//  disso
//
//  Created by Nika Pakravan on 16/03/2022.
//

import SwiftUI
import Photos
import PhotosUI
import Firebase
import FirebaseAuth

struct ClothingCard: View {
    var clothes: Clothes
    
    //@EnvironmentObject var clothesViewModel: ClothesViewModel
    //@ObservedObject private var viewModel = ClothesViewModel()
    
    var body: some View {
        VStack {
            
            AsyncImage(url: URL(string: clothes.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(alignment: .bottom) {
                        /*Text(clothes.name)
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(maxWidth: 136)
                            .padding()*/
                    }
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(alignment: .bottom) {
                        /*Text(clothes.name)
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(maxWidth: 136)
                            .padding()*/
                    }
            }
            
            /*if (clothes.image != nil) {
            Image(uiImage: clothes.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(alignment: .bottom) {
                    Text(clothes.name)
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(maxWidth: 136)
                        .padding()
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(alignment: .bottom) {
                        Text(clothes.name)
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(maxWidth: 136)
                            .padding()
                    }
            }*/
        }
        .frame(width: 160, height: 217, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors:[Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
        //.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
        /*.onAppear() {
            self.clothesViewModel.fetchClothes()
        }*/
    }
}

/*struct ClothingCard_Previews: PreviewProvider {
    static var previews: some View {
        ClothingCard(clothes:Clothes.all[0])
    }
}*/

