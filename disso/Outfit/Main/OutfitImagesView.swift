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
    
    @State private var navigateToAddOutfit = false
    
    var body: some View {
        
        ScrollView {
            
            Button {
                //button to add outfit to calendar
                navigateToAddOutfit = true
            } label: {
                Text("Add Outfit")
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
            }
            
            OutfitList(outfits: outfitsViewModel.createdOutfits)
            
            
        }
        
        /*.toolbar(content: {
            
            //done button
            ToolbarItem {
                NavigationLink(isActive: $navigateToAddOutfit) {
                    AddOutfitFormView()
                } label: {
                    Button {
                        
                        navigateToAddOutfit = true
                    } label: {
                        Label("Add", systemImage: "plus")
                            .labelStyle(.iconOnly)
                            .foregroundColor(.purple)
                    }
                }
            }

        })*/
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
