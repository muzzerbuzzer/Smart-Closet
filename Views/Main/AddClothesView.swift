//
//  AddClothesView.swift
//  Main
//
//  Created by Nika Pakravan on 14/03/2022.
//

import Foundation
import SwiftUI

struct AddClothesView: View {
    var body: some View {
        NavigationView {
            Text("New Clothes")
                .navigationTitle("New Clothes")
        }
        .navigationViewStyle(.stack)
    }
}

struct AddClothesView_Previews: PreviewProvider {
    static var previews: some View {
        AddClothesView()
    }
}
