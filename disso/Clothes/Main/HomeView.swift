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
    @EnvironmentObject var calendarViewModel: CalendarViewModel
    
    //@ObservedObject var model = ClothesViewModel()
    
    //@ObservedObject private var viewModel = ClothesViewModel()
    
    /*@State private var selectedView = "Clothes"
    let views = ["Clothes", "Outfits"]*/
    
    var body: some View {
        //NavigationView {
        
            ScrollView {
                
                ClothesList(clothes: clothesViewModel.closet)
                
            }
        
            .navigationTitle("\(sessionService.userDetails? .firstName ?? "N/A")'s Closet")
            .onAppear() {
                self.clothesViewModel.fetchClothes()
            }
        //}
        .navigationViewStyle(StackNavigationViewStyle())
        

        
        /*.toolbar(content: {
            Picker("Category", selection: $selectedView) {
                ForEach(views, id: \.self) {
                }
            }
            .pickerStyle(.menu)
            .accentColor(.purple)
        })*/
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .environmentObject(ClothesViewModel())
                .environmentObject(SessionServiceImpl())
                .environmentObject(CalendarViewModel())
            
                /*.toolbar(content: {

                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        NavigationLink(destination: CalendarView()) {
                            Label("Calendar", systemImage: "calendar")
                                .labelStyle(.iconOnly)
                                .foregroundColor(.purple)
                        }
               }
            })*/
        }

    }
}


