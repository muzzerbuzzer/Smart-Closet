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

struct OutfitCard_Previews: PreviewProvider {
    static var previews: some View {
        OutfitCard(outfits: Outfits.all[0])
    }
}

