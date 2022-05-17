//
//  AddOutfitFormView.swift
//  disso
//
//  Created by Nika Pakravan on 17/05/2022.
//

import Foundation
import SwiftUI
import Photos
import PhotosUI
import Firebase
import FirebaseAuth
import FirebaseStorage

struct AddOutfitFormView: View {
    @State private var navigateToCreatedOutfit = false
    @State private var outfitImage = UIImage()
    @State var addImage = false
    @State var openGallery = false
    //@State var image = UIImage()
    
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            
            //form to add information
            Form {
                
                Section(header: Text("Image")) {
                    Button(action: {
                            addImage = true
                            openGallery = true
                        
                    }, label: {
                        Text("Add Image")
                            .foregroundColor(.purple)
                        if addImage {
                            Image(uiImage: outfitImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                        
                        })
                }
               

 
            }

            //sheet to show gallery so user can choose outfit image
            .sheet(isPresented: $openGallery) {
                ImagePickerModel(selectedImage: $outfitImage, sourceType: .photoLibrary)
            }
            
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                            .foregroundColor(.purple)
                    }
                }
                
                
                ToolbarItem {
                    NavigationLink(isActive: $navigateToCreatedOutfit) {
                        OutfitImagesView()
                    } label: {
                        Button {
                            uploadOutfit()
                            
                            navigateToCreatedOutfit = true
                        } label: {
                            Label("Save", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                                .foregroundColor(.purple)
                        }
                    }
                }
            })
            
            .navigationTitle("Add Outfit")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        .navigationViewStyle(.stack)
    }
}

/*struct AddOutfitFormView: PreviewProvider {
    static var previews: some View {
        AddOutfitFormView()
           // .environmentObject(CalendarViewModel())
    }
}*/

    extension AddOutfitFormView {
        private func uploadOutfit() {
            let photoData = outfitImage.jpegData(compressionQuality: 0.5)
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
