//
//  AddOutfitFormView.swift
//  disso
//
//  Created by Nika Pakravan on 17/05/2022.
//

//add outfit form
/*Uploading the image is from Josh Kinney's 'Create an Image Picker, Access Camera and Photo Library in SwiftUI (NEW 2021)'
 video tutorial on YouTube
 Part of the code is from John Gallaugher's "Ch.8.22 Saving Images to Firebase Storage w/a Cloud Firestore Reference" video tutorial on YouTube
 Uploading the data is from a part of code from UTrend on GitHub
 Rest of the code is written by me*/

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
    
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            
            //form to add information
            Form {
                
                Section(header: Text("Image")) {
                    Button(action: {
                        //from Josh Kinney
                            addImage = true
                            openGallery = true
                        
                    }, label: {
                        Text("Add Image")
                            .foregroundColor(.purple)
                        //from Josh Kinney
                        if addImage {
                            Image(uiImage: outfitImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                        
                        })
                }
               

 
            }

            //sheet to show gallery so user can choose outfit image
            //from Josh Kinney on YouTube
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
                
                
                //navigate to the created outfits page
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


    extension AddOutfitFormView {
        
        //Full function logic from UTrend on GitHub
        private func uploadOutfit() {
            let photoData = outfitImage.jpegData(compressionQuality: 0.5)
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
