//
//  SettingsView.swift
//  disso
//
//  Created by Nika Pakravan on 14/03/2022.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    var body: some View {
        //NavigationView {
        
        VStack(alignment: .leading,
               spacing: 16) {
            
            VStack(alignment: .leading,
                   spacing: 16) {
                Text("First Name: \(sessionService.userDetails? .firstName ?? "N/A")")
                Text("Last Name: \(sessionService.userDetails? .lastName ?? "N/A")")
            }
            
            ButtonComponentView(title: "Logout") {
                sessionService.logout()
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
                //.environmentObject(SessionServiceImpl())
        }
    }
}
