//
//  ClothesList.swift
//  disso
//
//  Created by Nika Pakravan on 16/03/2022.
//

//clothing list for main view
/*Most of this is from DesignCode's "Build a Recipe App from scratch with SwiftUI - Part 1", as well as part 2
 Values have been re-named to fit the applications needs
 Those codes are by me
*/
import SwiftUI

struct ClothesList: View {
    var clothes: [Clothes]
    @EnvironmentObject var clothesViewModel: ClothesViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("\(clothes.count) \(clothes.count > 1 ? "items" : "item")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(clothesViewModel.closet) { clothes in
                    NavigationLink(destination: ClothesView(clothes: clothes)) {
                        ClothingCard(clothes: clothes)
                    }
                }
            }
            .padding(.top)
                                
      }
      .padding(.horizontal)
  }

}




