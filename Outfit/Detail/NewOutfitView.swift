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
        
        VStack(spacing: 0 ) {
            //documentBody
            palette
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
    
    /*var documentBody: some View {
        ZStack {
            
        }
    }*/

    
    var palette: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(clothes) { clothes in
                    ScrollingClothingView(image: clothes.image)
                        .onDrag {return NSItemProvider(object: clothes.image as UIImage)}
                }
            }
            .padding()
            .frame(height: 70)
        
    }
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

struct OutfitArea: View {
      @State private var image: UIImage!
      @State private var active = 0
      
      var body: some View {
          let dropDelegate = MyDropDelegate(image: $image, active: $active)
          
          return VStack {
              HStack {
                  GridCell(active: self.active == 1, image: image)
                  
                  GridCell(active: self.active == 3, image: image)
              }
              
              HStack {
                  GridCell(active: self.active == 2, image: image)

                  GridCell(active: self.active == 4, image: image)
              }
              
          }
          .background(Rectangle().fill(Color.gray))
          .frame(width: 300, height: 300)
          .onDrop(of: ["clothesImage.jpg"], delegate: dropDelegate)
          
      }
  }

struct GridCell: View {
    let active: Bool
    let image: UIImage?
    
    var body: some View {
        let droppedImage = Image(uiImage: image!)
            .resizable()
            .frame(width: 150, height: 150)
        
        return Rectangle()
            .fill(self.active ? Color.green : Color.clear)
            .frame(width: 150, height: 150)
            .overlay(droppedImage)
    }
}
  
struct MyDropDelegate: DropDelegate {
    @Binding var image: UIImage!
    @Binding var active: Int
    
    func validateDrop(info: DropInfo) -> Bool {
                return info.hasItemsConforming(to: ["clothesImage.jpg"])
            }
    
    func performDrop(info: DropInfo) -> Bool {
        
        let gridPosition = getGridPosition(location: info.location)
        self.active = gridPosition
        
        if let item = info.itemProviders(for: ["clothesImage.jpg"]).first {
            item.loadItem(forTypeIdentifier: "clothesImage.jpg", options: nil) { (imageData, error) in
                DispatchQueue.main.async {
                    /*if let imageData = imageData as? Data {
                        self.image[gridPosition] =
                        (UIImage(data: imageData))
                    }*/
                }
            }
            return true
            
        } else {
            return false
        }

    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
                self.active = getGridPosition(location: info.location)
                            
                return nil
            }
    
    func dropExited(info: DropInfo) {
                self.active = 0
            }
    
    func getGridPosition(location: CGPoint) -> Int {
                if location.x > 150 && location.y > 150 {
                    return 4
                } else if location.x > 150 && location.y < 150 {
                    return 3
                } else if location.x < 150 && location.y > 150 {
                    return 2
                } else if location.x < 150 && location.y < 150 {
                    return 1
                } else {
                    return 0
                }
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
