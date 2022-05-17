//
//  HomeView.swift
//  disso
//
//  Created by Nika Pakravan on 14/03/2022.
//

//home view
/*This code's logic is from DesignCode's "Build a Recipe App from scratch with SwiftUI - Part 1", as well as part 2
 Part of the code is from tundsdev's
 'Firebase SwiftUI Auth, Login, Registration, Password Reset, Sign Out - Bug Fix In Description' video tutorial on YouTube
 One section is from Firebase's SwiftUI: Fetching data from Firestore in real-time video tutorial on YouTube
 Rest of the code is written by me*/
import Foundation
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var clothesViewModel: ClothesViewModel
    @EnvironmentObject var sessionService: SessionServiceImpl
    @EnvironmentObject var calendarViewModel: CalendarViewModel
    
    var body: some View {
        
            ScrollView {
                
                ClothesList(clothes: clothesViewModel.closet)
                
            }
        
        //session service from tundsdev on YouTUbe
            .navigationTitle("\(sessionService.userDetails? .firstName ?? "N/A")'s Closet")
        //From Firebase on YouTube
            .onAppear() {
                self.clothesViewModel.fetchClothes()
            }

        .navigationViewStyle(StackNavigationViewStyle())
        
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .environmentObject(ClothesViewModel())
                .environmentObject(SessionServiceImpl())
                .environmentObject(CalendarViewModel())

        }

    }
}


