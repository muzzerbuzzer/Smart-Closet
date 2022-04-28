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
            
            Image(uiImage: outfits.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                

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
