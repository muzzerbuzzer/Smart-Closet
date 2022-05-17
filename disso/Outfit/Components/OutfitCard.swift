//
//  OutfitCard.swift
//  disso
//
//  Created by Nika Pakravan on 28/04/2022.
//

//outfit card for main view
/*Most of this is from DesignCode's "Build a Recipe App from scratch with SwiftUI - Part 1", as well as part 2
 Only some aspects are removed
 Values have been re-named to fit the applications needs
 Those codes are by me*/
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

