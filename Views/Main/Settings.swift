//
//  Settings.swift
//  disso
//
//  Created by Nika Pakravan on 14/03/2022.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("My Clothes")
                .navigationTitle("My Clothes")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
