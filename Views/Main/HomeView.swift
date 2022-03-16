//
//  HomeView.swift
//  disso
//
//  Created by Nika Pakravan on 14/03/2022.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List(Clothes.all) { clothes in
                Text(clothes.name)
                    .navigationTitle("My Clothes")
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
