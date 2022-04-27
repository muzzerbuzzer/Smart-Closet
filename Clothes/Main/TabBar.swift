//
//  TabBar.swift
//  disso
//
//  Created by Nika Pakravan on 14/03/2022.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            AddClothesView()
                .tabItem {
                    Label("Add Clothes", systemImage: "plus")
                }
            
            AddOutfitView()
                .tabItem {
                    Label("Add Outfit", systemImage: "tshirt.fill")
                }
            
            /*FavouritesView()
                .tabItem {
                    Label("Favourites", systemImage: "heart")
                }*/
            
            CategoriesView()
                .tabItem {
                    Label("Categories", systemImage: "square.fill.text.grid.1x2")
                }
            
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(ClothesViewModel())
            //.environmentObject(SessionServiceImpl())
    }
}
