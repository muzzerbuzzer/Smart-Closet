//
//  AddOutfitView.swift
//  disso
//
//  Created by Nika Pakravan on 11/04/2022.
//

import Foundation
import SwiftUI

struct AddOutfitView: View {
    @EnvironmentObject var clothesViewModel: ClothesViewModel
    @EnvironmentObject var outfitsViewModel: OutfitsViewModel
    //@State private var showNewOutfit = false
    
    var body: some View {
        NavigationView {
            /*Button("Click here to add a new outfit!") {
                showNewOutfit = true
            }*/
            NavigationLink(destination: NewOutfitView(clothes: clothesViewModel.closet, outfits: outfitsViewModel.createdOutfits)) {
                Label("Click here to add a new Outfit!", systemImage: "plus")
                    .foregroundColor(.purple)
            }
            
            
            //.navigationTitle("New Outfit")
        }
        .navigationViewStyle(.stack)
        .onAppear() {
            self.clothesViewModel.fetchClothes()
        }
        /*.sheet(isPresented: $showNewOutfit) {
            NewOutfitView(clothes: clothes)
        }*/
    }
}

struct AddOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        AddOutfitView()
    }
}



