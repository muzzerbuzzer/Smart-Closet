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
            
            Image(uiImage: outfits.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
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

