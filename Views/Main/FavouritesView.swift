//
//  FavouritesView.swift
//  disso
//
//  Created by Nika Pakravan on 14/03/2022.
//

import Foundation
import SwiftUI

struct FavouritesView: View {
    var body: some View {
        NavigationView {
            Text("You haven't added any clothes to your favourites!")
                .navigationTitle("Favourites")
        }
        .navigationViewStyle(.stack)
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
