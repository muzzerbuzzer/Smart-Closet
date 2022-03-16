//
//  ClothesList.swift
//  disso
//
//  Created by Nika Pakravan on 16/03/2022.
//

import SwiftUI

struct ClothesList: View {
    var clothes: [Clothes]
    
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
                ForEach(clothes) { clothes in
                    ClothingCard(clothes: clothes)
                }
            }
            .padding(.top)
                                
      }
      .padding(.horizontal)
  }
}

struct ClothesList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            ClothesList(clothes: Clothes.all)
        }
    }
}
