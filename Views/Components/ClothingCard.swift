//
//  ClothingCard.swift
//  disso
//
//  Created by Nika Pakravan on 16/03/2022.
//

import SwiftUI

struct ClothingCard: View {
    var clothes: Clothes
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: clothes.image)) { image in
                image
            } placeholder: {
                Image(systemName: "photo")
            }
        }
        .frame(width: 160, height: 217, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors:[Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

struct ClothingCard_Previews: PreviewProvider {
    static var previews: some View {
        ClothingCard(clothes:Clothes.all[0])
    }
}
