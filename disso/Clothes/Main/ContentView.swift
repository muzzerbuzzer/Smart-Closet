//
//  ContentView.swift
//  Main
//
//  Created by Nika Pakravan on 14/03/2022.
//

//showing content
/*This code's logic is from DesignCode's "Build a Recipe App from scratch with SwiftUI - Part 1", as well as part 2
 Actual code is written by me*/
import Foundation
import SwiftUI

struct ContentView: View {
    
    var body: some View {
            TabBar()
        
        //show calendar
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
            .environmentObject(CalendarViewModel())
            .environmentObject(OutfitsViewModel())
    }
}
