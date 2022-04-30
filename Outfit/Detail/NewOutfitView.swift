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
    var outfits: [Outfits]
    @EnvironmentObject var clothesViewModel: ClothesViewModel
    @EnvironmentObject var outfitsViewModel: OutfitsViewModel

    @State var image = UIImage()
    @State private var navigateToCreatedOutfit = false

    var body: some View {
        
        VStack {
        Divider()
        Spacer()
            HStack {
                Text("outfit creation happens here")
            }
            Spacer()
            Divider()
             ScrollView(.horizontal) {
                 HStack {
                     ForEach(clothes) { clothes in
                         ScrollingClothingView(image: clothes.image)
                             .onDrag {return NSItemProvider(object: clothes.image as UIImage)}
                     }
                 }
                 .padding()
         } .frame(height: 70)
        }
        
        .toolbar(content: {
            ToolbarItem {
                NavigationLink(isActive: $navigateToCreatedOutfit) {
                    /*OutfitsView(outfits: Outfits.all[0])
                        .navigationBarBackButtonHidden(true)*/
                } label: {
                    Button {
                        //saveOutfit()
                        navigateToCreatedOutfit = true
                    } label: {
                        Label("Save", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                            .foregroundColor(.purple)
                    }
                }
            }
        })
        
}
    
}


struct ScrollingClothingView: View {
    @State var image: UIImage!

    var body: some View {
        ZStack {
            HStack {
                if (image != nil) {
                Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
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
        }
    }
}

struct ImageDropDelegate: DropDelegate {
    @Binding var image: [UIImage?]
    
    func performDrop(info: DropInfo) -> Bool {
        guard info.hasItemsConforming(to: ["outfitImage.jpg"]) else {
            return false
        }
        
        if let item = info.itemProviders(for: ["outfitImage.jpg"]).first {
            item.loadItem(forTypeIdentifier: "outfitImage.jpg", options: nil) {(imageData, error) in
                DispatchQueue.main.async {
                    if let imageData = imageData as? [UIImage] {
                        self.image = imageData
                    }
                }
            }
        }
        
        return true
    }
}

struct NewOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        NewOutfitView(clothes: Clothes.all, outfits: Outfits.all)
            .environmentObject(ClothesViewModel())
    }
}

/*extension NewOutfitView{
    private func saveOutfit() {
        let now = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let dateAdded = dateFormatter.string(from: now)
        print (dateAdded)
        
        let outfits = Outfits(image: image/*, dateAdded: dateAdded*/)
        
        outfitsViewModel.addOutfit(outfits: outfits)
    }
    
}*/
