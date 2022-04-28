//
//  OutfitList.swift
//  disso
//
//  Created by Nika Pakravan on 28/04/2022.
//

import SwiftUI

struct OutfitList: View {
    var outfits: [Outfits]
    
    var body: some View {
        VStack {
            HStack {
                Text("\(outfits.count) \(outfits.count > 1 ? "items" : "item")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(outfits) { outfits in
                    NavigationLink(destination: OutfitsView(outfits: outfits)) {
                        OutfitCard(outfits: outfits)
                    }
                }
            }
            .padding(.top)
                                
      }
      .padding(.horizontal)
  }
}

struct OutfitList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            OutfitList(outfits: Outfits.all)
        }
    }
}



