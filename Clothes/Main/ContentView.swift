//
//  ContentView.swift
//  Main
//
//  Created by Nika Pakravan on 14/03/2022.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
       //NavigationView {
            TabBar()
            
        //}
        
            .toolbar(content: {

                ToolbarItem {
                    
                    NavigationLink(destination: CalendarView()) {
                        Label("Calendar", systemImage: "calendar")
                            .labelStyle(.iconOnly)
                            .foregroundColor(.purple)
                    }
           }
        })
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ClothesViewModel())
            .environmentObject(SessionServiceImpl())
    }
}