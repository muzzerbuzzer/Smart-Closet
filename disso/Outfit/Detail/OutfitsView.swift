//
//  OutfitsView.swift
//  disso
//
//  Created by Nika Pakravan on 28/04/2022.
//

import SwiftUI

struct OutfitsView: View {
    var outfits: Outfits
    @EnvironmentObject var outfitsViewModel: OutfitsViewModel
    
    var body: some View {
        ScrollView {
            
            AsyncImage(url: URL(string: outfits.image)) { image in
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
                

                Button("Delete") {
                    //
                }
                

            }
            
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }

    }

struct OutfitsView_Previews: PreviewProvider {
    static var previews: some View {
        OutfitsView(outfits: Outfits.all[0])
    }
}
