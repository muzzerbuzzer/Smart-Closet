//
//  FavouritesView.swift
//  disso
//
//  Created by Nika Pakravan on 14/03/2022.
//

//code is written by me
import Foundation
import SwiftUI

struct OutfitImagesView: View {
    @EnvironmentObject var outfitsViewModel: OutfitsViewModel
    
    @State private var navigateToAddOutfit = false
    
    var body: some View {
        
        ScrollView {
            
            Button {
                //button to add new outfit to view
                navigateToAddOutfit = true
            } label: {
                Text("Add Outfit")
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
            }
            
            OutfitList(outfits: outfitsViewModel.createdOutfits)
            
            
        }
        .navigationTitle("Outfits")
        .navigationViewStyle(.stack)
        .sheet(isPresented: $navigateToAddOutfit) {
            AddOutfitFormView()
        }
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
