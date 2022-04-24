//
//  NewOutfitView.swift
//  disso
//
//  Created by Nika Pakravan on 11/04/2022.
//

import Foundation
import SwiftUI

struct NewOutfitView: View {
    
    @State private var showClothesImages = false
    
    var body: some View {
        NavigationView {
            
            Text("beep boop")
            
            
            .toolbar(content: {

                ToolbarItem {
                    Button {
                        showClothesImages = true
                    } label: {
                    Label("Add", systemImage: "plus")
                    .labelStyle(.iconOnly)
             }
           }
        })
                /*.navigationTitle("New Outfit")
                .navigationBarTitleDisplayMode(.inline)*/
        }
        .sheet(isPresented: $showClothesImages) {
            ClothesImagesView(clothes: Clothes.all)
        .navigationViewStyle(.stack)
        }
    }
}

struct NewOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        NewOutfitView()
    }
}

