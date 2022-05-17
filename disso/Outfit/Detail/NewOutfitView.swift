//
//  NewOutfitView.swift
//  disso
//
//  Created by Nika Pakravan on 11/04/2022.
//

//new outfit creation page
/* The main drag and drop logic is from javier at The SwiftUILab. However, mostly all of it has been amended to fit the code
 The code to snapshot the outfit creation as image is re-used from Codakuma's blog post "A better way to create images from SwiftUI views."
 Part of the code is from John Gallaugher's "Ch.8.22 Saving Images to Firebase Storage w/a Cloud Firestore Reference" video tutorial on YouTube
 Uploading the data is from a part of code from UTrend on GitHub
 Uploading the image is from Josh Kinney's 'Create an Image Picker, Access Camera and Photo Library in SwiftUI (NEW 2021)'
 video tutorial on YouTube
 One small portion is from SwiftOnTap blog post "onDrop(of:delegate:)"
 One small portion is from Paul Hudson's blog "How to convert a SwiftUI view to an image"
 Rest of the code is written by me*/
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
    
    @State var draggedImage: [Int: String] = [:]
    @State var active = 0
    
    var body: some View {
        
        VStack {
        Divider()
        Spacer()
            
            //Drag and drop logic is from javier at The SwiftUILab. names have been ammended
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
                        
                        //save created image to gallery
                        //from a hackingWithSwift blog post
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

    //Drag and drop logic is from javier at The SwiftUILab. parts have been ammended
    struct GridCell: View {
        let active: Bool
        let image: String?
        
        var body: some View {
            
            //this was written by me
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
            
            //Drag and drop logic is from javier at The SwiftUILab. names have been ammended
            return Rectangle()
                .fill(self.active ? Color.purple : Color.clear)
                .frame(width: 150, height: 150)
                .overlay(img)
        }
    }

    //Entire struct -> Drag and drop logic is from javier at The SwiftUILab. "public.text" name was been ammended
    struct ImageDropDelegate: DropDelegate {
        //dragged image was ammended
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
                        //this portion was changed by me to work with a string as image
                        if let imageData = imageData as? Data {
                            //decoding: imageData, as: UTF8.self was obtained from SwiftOnTap blog
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

extension NewOutfitView {
    //Full function logic from UTrend on GitHub
    private func uploadOutfit() {
        let photoData = image.jpegData(compressionQuality: 0.5)
        let user = Auth.auth().currentUser?.uid
        let db = Firestore.firestore()
        let photoName = UUID().uuidString
        let ref = Storage.storage().reference().child("users").child(user!).child("outfits")
        
        //create image metadata so it can be viewed in firebase console
        //metadata code is from John Gallaugher on YouTube
        let imageMetaData = StorageMetadata()
        imageMetaData.contentType = "image/jpeg"

        ref.child(photoName).putData(photoData!, metadata: imageMetaData) { (meta, err) in
            if err != nil {return}
            
            //downloading the URL is from iOS Academy
            ref.child(photoName).downloadURL(completion: { url, error in
                guard let url = url, error == nil else {
                    return
            }
                
                //downloading the URL is from iOS Academy
                let imageURL = url.absoluteString
                print("Download URL: \(imageURL)")
                UserDefaults.standard.set(imageURL, forKey: "url")
                
                db.collection("users").document(user!).collection("outfits").addDocument(data: ["outfitLink":imageURL])
                
            })
            
        }

    }
    
}

extension View {
    
    //entire code is from Codakuma's blog post
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

        


