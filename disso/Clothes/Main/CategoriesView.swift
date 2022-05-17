//
//  CategoriesView.swift
//  disso
//
//  Created by Nika Pakravan on 14/03/2022.
//

//categories
/*This code's logic is from DesignCode's "Build a Recipe App from scratch with SwiftUI - Part 1", as well as part 2
 Actual code is written by me*/
import Foundation
import SwiftUI

struct CategoriesView: View {
    @EnvironmentObject var clothesViewModel: ClothesViewModel
    @EnvironmentObject var calendarViewModel: CalendarViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Category.allCases) { category in
                    NavigationLink {
                        ScrollView {
                            ClothesList(clothes: clothesViewModel.closet.filter{ $0.category == category.rawValue})
                        }
                        .navigationTitle(category.rawValue)
                    } label: {
                        Text(category.rawValue)
                    }
                }
            }
            .navigationTitle("Categories")
        }
        .navigationViewStyle(.stack)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
            .environmentObject(ClothesViewModel())
            .environmentObject(CalendarViewModel())
    }
}
