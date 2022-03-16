//
//  ClothesView.swift
//  disso
//
//  Created by Nika Pakravan on 16/03/2022.
//

import SwiftUI

struct ClothesView: View {
    var clothes: Clothes
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: clothes.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors:[Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
            
            VStack (spacing: 30) {
                Text(clothes.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    
                if !clothes.colour.isEmpty {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Colour: ")
                            .font(.headline)
                            
                        Text(clothes.colour)
                    }
                }
                
                if !clothes.pattern.isEmpty {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Pattern: ")
                            .font(.headline)
                        
                        Text(clothes.pattern)
                    }
                }

                if !clothes.category.isEmpty {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Category: ")
                            .font(.headline)
                        
                        Text(clothes.category)
                    }
                }

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }
    }
}

struct ClothesView_Previews: PreviewProvider {
    static var previews: some View {
        ClothesView(clothes: Clothes.all[0])
    }
}
