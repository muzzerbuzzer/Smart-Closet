//
//  AddOutfitView.swift
//  disso
//
//  Created by Nika Pakravan on 11/04/2022.
//

import Foundation
import SwiftUI

struct AddOutfitView: View {
    @State private var showNewOutfit = false
    
    var body: some View {
        NavigationView {
            Button("Click here to add a new outfit!") {
                showNewOutfit = true
            }
            .navigationTitle("New Outfit")
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showNewOutfit) {
            NewOutfitView()
        }
    }
}

struct AddOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        AddOutfitView()
    }
}



