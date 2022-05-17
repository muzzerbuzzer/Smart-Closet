//
//  SettingsView.swift
//  disso
//
//  Created by Nika Pakravan on 14/03/2022.
//

//categories
/*Part of this code is from tundsdev's
 'Firebase SwiftUI Auth, Login, Registration, Password Reset, Sign Out - Bug Fix In Description' video tutorial on YouTube
 The rest is written by me*/
import Foundation
import SwiftUI

struct SettingsView: View {
    //From tundsdev
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    var body: some View {
        NavigationView {
        
        VStack(alignment: .leading,
               spacing: 16) {
            
            VStack(alignment: .leading,
                   spacing: 16) {
                //From tundsdev
                Text("First Name: \(sessionService.userDetails? .firstName ?? "N/A")")
                Text("Last Name: \(sessionService.userDetails? .lastName ?? "N/A")")
            }
            
            //From tundsdev
            ButtonComponentView(title: "Logout") {
                sessionService.logout()
            }
            
        }
        
        .padding(.horizontal, 16)
        .navigationTitle("Settings")
        }
        .navigationViewStyle(.stack)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
            SettingsView()
        //From tundsdev
                .environmentObject(SessionServiceImpl())
    }
}
