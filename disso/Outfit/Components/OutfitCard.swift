//
//  OutfitCard.swift
//  disso
//
//  Created by Nika Pakravan on 28/04/2022.
//

import SwiftUI
import Photos
import PhotosUI

struct OutfitCard: View {
    var outfits: Outfits
    
    
    var body: some View {
        VStack {
            
            AsyncImage(url: URL(string: outfits.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(alignment: .bottom) {

                    }
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(alignment: .bottom) {

                    }
            }
            }
        .frame(width: 160, height: 217, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors:[Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
        }
}

struct OutfitCard_Previews: PreviewProvider {
    static var previews: some View {
        OutfitCard(outfits: Outfits.all[0])
    }
}

