//
//  NewOutfitView.swift
//  disso
//
//  Created by Nika Pakravan on 11/04/2022.
//

import Foundation
import SwiftUI

struct NewOutfitView: View {
    var body: some View {
        NavigationView {
            Text("beep boop")
                .navigationTitle("New Outfit")
        }
        .navigationViewStyle(.stack)
    }
}

struct NewOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        NewOutfitView()
    }
}
