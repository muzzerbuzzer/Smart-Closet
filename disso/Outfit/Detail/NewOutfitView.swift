//
//  NewOutfitView.swift
//  disso
//
//  Created by Nika Pakravan on 11/04/2022.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseStorage
import Firebase

struct NewOutfitView: View {
    
    var clothes: [Clothes]
    var outfits: [Outfits]
    @EnvironmentObject var clothesViewModel: ClothesViewModel
    @EnvironmentObject var outfitsViewModel: OutfitsViewModel

    @State var clothingImage = String()
    @State var image = UIImage()
    @State private var navigateToCreatedOutfit = false
    
    @State var actives = Bool()
    @State var gridImage = String()
    
   /*var outfitView: some View {
       DropArea()
    }*/

    @State var draggedImage: [Int: String] = [:]
    @State var active = 0
    
    var body: some View {
        
        VStack {
        Divider()
        Spacer()
            //HStack {
                //outfitView
                let dropDelegate = ImageDropDelegate(draggedImage: $draggedImage, active: $active)
                
                VStack {
                    HStack {
                        GridCell(active: self.active == 1, image: draggedImage[1])
                        GridCell(active: self.active == 3, image: draggedImage[3])
                    }
                    
                    HStack {
                        GridCell(active: self.active == 2, image: draggedImage[2])
                        GridCell(active: self.active == 4, image: draggedImage[4])
                    }
                }
                .background(Rectangle().fill(Color.gray))
                .frame(width: 300, height: 300)
                .onDrop(of: ["public.text"], delegate: dropDelegate)
            //}
            Spacer()
            Divider()
             ScrollView(.horizontal) {
                 HStack {
                     ForEach(clothesViewModel.closet) { clothes in
                         ScrollingClothingView(clothingImage: clothes.image)
                     }
                 }
                 .padding()
         } .frame(height: 70)
        }
        .onAppear() {
            self.clothesViewModel.fetchClothes()
        }
        
        
        .toolbar(content: {
            ToolbarItem {
                NavigationLink(isActive: $navigateToCreatedOutfit) {
                    OutfitImagesView()
                } label: {
                    Button {
                        image = body.asImage
                        uploadOutfit()
                        
                        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                        
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
    
    struct ScrollingClothingView: View {
        let clothingImage: String

        var body: some View {
            ZStack {
                HStack {
                    AsyncImage(url: URL(string: clothingImage)) { image in
                        image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    .onDrag { return NSItemProvider(object: self.clothingImage as NSString) }
                    } placeholder: {
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

    /*struct DropArea: View {
        @State var draggedImage: [Int: String] = [:]
        @State var active = 0
        
        var body: some View {
            let dropDelegate = ImageDropDelegate(draggedImage: $draggedImage, active: $active)
            
            return VStack {
                HStack {
                    GridCell(active: self.active == 1, image: draggedImage[1])
                    GridCell(active: self.active == 3, image: draggedImage[3])
                }
                
                HStack {
                    GridCell(active: self.active == 2, image: draggedImage[2])
                    GridCell(active: self.active == 4, image: draggedImage[4])
                }
            }
            .background(Rectangle().fill(Color.gray))
            .frame(width: 300, height: 300)
            .onDrop(of: ["public.text"], delegate: dropDelegate)
        }
    }*/

    struct GridCell: View {
        let active: Bool
        let image: String?
        
        var body: some View {
            
            let img = AsyncImage(url: URL(string: image ?? "")) { image in
                image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            return Rectangle()
                .fill(self.active ? Color.purple : Color.clear)
                .frame(width: 150, height: 150)
                .overlay(img)
        }
    }

    struct ImageDropDelegate: DropDelegate {
        @Binding var draggedImage: [Int: String]
        @Binding var active: Int
        
        func validateDrop(info: DropInfo) -> Bool {
            return info.hasItemsConforming(to: ["public.text"])
            }
            
        func performDrop(info: DropInfo) -> Bool {
            let gridPosition = getGridPosition(location: info.location)
            self.active = gridPosition
            
            if let item = info.itemProviders(for: ["public.text"]).first {
                item.loadItem(forTypeIdentifier: "public.text", options: nil) {(imageData, error) in
                    DispatchQueue.main.async {
                        if let imageData = imageData as? Data {
                            self.draggedImage[gridPosition] = String(decoding: imageData, as: UTF8.self)
                        }
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
    
}

/*struct NewOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        /*NewOutfitView(clothes: Clothes.all, outfits: Outfits.all)
            .environmentObject(ClothesViewModel())
            .environmentObject(OutfitsViewModel())*/
    }
}*/

extension NewOutfitView {
    private func uploadOutfit() {
        let photoData = image.jpegData(compressionQuality: 0.5)
        let user = Auth.auth().currentUser?.uid
        let db = Firestore.firestore()
        let photoName = UUID().uuidString
        let ref = Storage.storage().reference().child("users").child(user!).child("outfits")
        
        //create image metadata so it can be viewed in firebase console
        let imageMetaData = StorageMetadata()
        imageMetaData.contentType = "image/jpeg"

        ref.child(photoName).putData(photoData!, metadata: imageMetaData) { (meta, err) in
            if err != nil {return}
            
            ref.child(photoName).downloadURL(completion: { url, error in
                guard let url = url, error == nil else {
                    return
            }
                
                let imageURL = url.absoluteString
                print("Download URL: \(imageURL)")
                UserDefaults.standard.set(imageURL, forKey: "url")
                
                db.collection("users").document(user!).collection("outfits").addDocument(data: ["outfitLink":imageURL])
                
            })
            
        }

    }
    
}

extension View {
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

        


