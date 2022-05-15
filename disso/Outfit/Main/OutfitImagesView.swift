//
//  FavouritesView.swift
//  disso
//
//  Created by Nika Pakravan on 14/03/2022.
//

import Foundation
import SwiftUI

struct OutfitImagesView: View {
    @EnvironmentObject var outfitsViewModel: OutfitsViewModel
    
    var body: some View {
        
        ScrollView {
            
            OutfitList(outfits: outfitsViewModel.createdOutfits)
            
            
        }
        
                .navigationTitle("Outfits")
        .navigationViewStyle(.stack)
        .onAppear() {
            self.outfitsViewModel.fetchOutfits()
        }
    }
}

struct OutfitImagesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        OutfitImagesView()
            .environmentObject(OutfitsViewModel())
        }
    }
}
