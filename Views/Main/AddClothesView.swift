//
//  AddClothesView.swift
//  Main
//
//  Created by Nika Pakravan on 14/03/2022.
//

import Foundation
import SwiftUI

struct AddClothesView: View {
    @State private var showNewClothes = false
    
    var body: some View {
        NavigationView {
            Button("Add new clothing item") {
                showNewClothes = true
            }
            .navigationTitle("New Clothes")
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showNewClothes) {
            NewClothesView()
        }
    }
}

struct AddClothesView_Previews: PreviewProvider {
    static var previews: some View {
        AddClothesView()
    }
}

