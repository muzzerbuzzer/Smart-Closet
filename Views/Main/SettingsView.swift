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
        //NavigationView {
        
        VStack(alignment: .leading,
               spacing: 16) {
            
            VStack(alignment: .leading,
                   spacing: 16) {
                Text("First Name: <Placeholder>")
                Text("Last Name: <Placeholder>")
            }
            
            ButtonComponentView(title: "Logout") {
                //logout action here
            }
            
        }
        
        .padding(.horizontal, 16)
        .navigationTitle("Settings")
        //}
        .navigationViewStyle(.stack)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}
