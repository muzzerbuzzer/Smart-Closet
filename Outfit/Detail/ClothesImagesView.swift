//
//  ClothesImagesView.swift
//  disso
//
//  Created by Nika Pakravan on 23/04/2022.
//

import Foundation
import SwiftUI

struct ClothesImagesView: View {
    var clothes: [Clothes]
    
    var body: some View {
        //VStack {
        ScrollView {
            
            /*LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(clothes) { clothes in
                    NavigationLink(destination: NewOutfitView(clothes: Clothes)){
                        ClothingCard(clothes: clothes)
                    }
                }
            }*/
            //.padding(.top)
        }
      //}
      //.padding(.horizontal)
  }
}

struct ClothesImagesView_Previews: PreviewProvider {
    static var previews: some View {
        //ScrollView {
            ClothesImagesView(clothes: Clothes.all)
        //}
    }
}
