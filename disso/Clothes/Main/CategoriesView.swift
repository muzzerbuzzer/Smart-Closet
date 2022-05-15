//
//  CategoriesView.swift
//  disso
//
//  Created by Nika Pakravan on 14/03/2022.
//

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
            .onAppear() {
                self.clothesViewModel.fetchClothes()
            }
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
