//
//  HomeView.swift
//  disso
//
//  Created by Nika Pakravan on 14/03/2022.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var clothesViewModel: ClothesViewModel
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    var body: some View {
        //NavigationView {
            ScrollView {
                
                ClothesList(clothes: clothesViewModel.closet)
                
            }
            .navigationTitle("\(sessionService.userDetails? .firstName ?? "N/A")'s Closet")
        //}
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .environmentObject(ClothesViewModel())
                .environmentObject(SessionServiceImpl())
        }

    }
}


