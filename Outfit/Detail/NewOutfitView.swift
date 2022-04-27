//
//  NewOutfitView.swift
//  disso
//
//  Created by Nika Pakravan on 11/04/2022.
//

import Foundation
import SwiftUI

struct NewOutfitView: View {
    
    var clothes: [Clothes]

    var body: some View {
        
        VStack {
            Divider()
            ScrollView(.horizontal) {
                HStack(spacing: 5) {
                    ForEach(clothes) { clothes in
                        RectangleView(/*label: clothes.name, */image: clothes.image)
                    }
                }.padding()
            }.frame(height: 70)
            
            Divider()
            Spacer()
            HStack {
                Text("The content of the Home view")
            }
            Spacer()
    }
}
}

struct RectangleView: View {
    //@State var label: String
    @State var image: UIImage!

    var body: some View {
        ZStack {
            HStack {
                if (image != nil) {
                Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                //.border(Color.gray, width: 1)
                .frame(width: 70, height: 70)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(.white.opacity(0.7))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            /*VStack {
                Spacer()
                Text(label)
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
                    .background(Color.white)
            }*/
        }
    }
}

struct NewOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        NewOutfitView(clothes: Clothes.all)
            .environmentObject(ClothesViewModel())
    }
}

