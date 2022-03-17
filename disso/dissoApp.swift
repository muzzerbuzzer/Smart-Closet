//
//  dissoApp.swift
//  disso
//
//  Created by Nika Pakravan on 12/03/2022.
//

import SwiftUI

@main
struct dissoApp: App {
    @StateObject var clothesViewModel = ClothesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(clothesViewModel)
        }
    }
}

