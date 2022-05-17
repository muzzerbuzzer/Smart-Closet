//
//  AddOutfitView.swift
//  disso
//
//  Created by Nika Pakravan on 11/04/2022.
//

//code is written by me
import Foundation
import SwiftUI

struct AddOutfitView: View {
    @EnvironmentObject var clothesViewModel: ClothesViewModel
    @EnvironmentObject var outfitsViewModel: OutfitsViewModel
    
    var body: some View {
        NavigationView {
            //direct to the outftit creation page
            NavigationLink(destination: NewOutfitView(clothes: clothesViewModel.closet, outfits: outfitsViewModel.createdOutfits)) {
                Label("Click here to add a new Outfit!", systemImage: "plus")
                    .foregroundColor(.purple)
            }

        }
        .navigationViewStyle(.stack)
    }
}

struct AddOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        AddOutfitView()
    }
}



