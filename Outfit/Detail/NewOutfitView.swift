//
//  NewOutfitView.swift
//  disso
//
//  Created by Nika Pakravan on 11/04/2022.
//

import Foundation
import SwiftUI

struct NewOutfitView: View {
    
    @State var selection: Set<UUID> = []

    var clothes: [Clothes]
    //var outfits: [Outfits]
    @EnvironmentObject var clothesViewModel: ClothesViewModel
    //@EnvironmentObject var outfitsViewModel: OutfitsViewModel

    @State var image = UIImage()
    @State private var navigateToCreatedOutfit = false
    
   var outfitView: some View {
        Text("outfit creation happens here")
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }

    var body: some View {
        
        VStack {
        Divider()
        Spacer()
            HStack {
                //DropArea()
                //Text("outfit creation happens here")
                outfitView
            }
            Spacer()
            Divider()
             ScrollView(.horizontal) {
                 HStack {
                     ForEach(clothes) { clothes in
                         ScrollingClothingView(image: clothes.image)
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
                        let outfitImage = outfitView.asImage
                        
                        print(outfitImage)
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
    let image: UIImage

    var body: some View {
        ZStack {
            HStack {
                Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .onDrag {return NSItemProvider(object: self.image as UIImage)}
            }
        }
    }
}

struct DropArea: View {
    @State var draggedImage: UIImage
    @State var active = 0
    
    var body: some View {
        let dropDelegate = ImageDropDelegate(image: $draggedImage, active: $active)
        
        return VStack {
            HStack {
                GridCell(active: self.active == 1, image: draggedImage)
                GridCell(active: self.active == 3, image: draggedImage)
            }
            
            HStack {
                GridCell(active: self.active == 2, image: draggedImage)
                GridCell(active: self.active == 4, image: draggedImage)
            }
        }
        .background(Rectangle().fill(Color.gray))
        .frame(width: 300, height: 300)
        .onDrop(of: ["outfitImage.jpg"], delegate: dropDelegate)
    }
}

struct GridCell: View {
    let active: Bool
    let image: UIImage?
    
    var body: some View {
        let img = Image(uiImage: image!)
            .resizable()
            .frame(width: 150, height: 150)
        
        return Rectangle()
            .fill(self.active ? Color.purple : Color.clear)
            .frame(width: 150, height: 150)
            .overlay(img)
    }
}

struct ImageDropDelegate: DropDelegate {
    @Binding var image: UIImage
    @Binding var active: Int
    
    func performDrop(info: DropInfo) -> Bool {
        guard info.hasItemsConforming(to: ["outfitImage.jpg"]) else {
            return false
        }
        
        if let item = info.itemProviders(for: ["outfitImage.jpg"]).first {
            item.loadItem(forTypeIdentifier: "outfitImage.jpg", options: nil) {(imageData, error) in
                DispatchQueue.main.async {
                    if let imageData = imageData as? UIImage {
                        self.image = imageData
                    }
                }
            }
        }
        
        return true
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
        NewOutfitView(clothes: Clothes.all/*, outfits: Outfits.all*/)
            .environmentObject(ClothesViewModel())
            //.environmentObject(OutfitsViewModel())
    }
}

extension NewOutfitView {
    var asImage: UIImage {
        //must ignore safe area due to bug in ios 15+
        let controller = UIHostingController(rootView: self.edgesIgnoringSafeArea(.top))
        let view = controller.view
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: targetSize)
        view?.backgroundColor = .clear
        
        let format = UIGraphicsImageRendererFormat()
        format.scale = 3 //ensures 3x-scale images; can be customised
        let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

        
        //outfitsViewModel.addOutfit(outfits: outfits)

