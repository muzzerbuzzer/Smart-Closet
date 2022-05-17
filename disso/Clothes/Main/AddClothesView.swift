//
//  AddClothesView.swift
//  Main
//
//  Created by Nika Pakravan on 14/03/2022.
//

//add clothes sub page
/*This code's logic is from DesignCode's "Build a Recipe App from scratch with SwiftUI - Part 1", as well as part 2
 Actual code is written by me*/
import Foundation
import SwiftUI

struct AddClothesView: View {
    @State private var showNewClothes = false
    
    var body: some View {
        NavigationView {
            //navigate to clothing item addition page
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

