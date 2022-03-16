//
//  SettingsView.swift
//  disso
//
//  Created by Nika Pakravan on 14/03/2022.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Text("V1.0.0")
                .navigationTitle("Settings")
        }
        .navigationViewStyle(.stack)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
