//
//  NewClothesView.swift
//  disso
//
//  Created by Nika Pakravan on 16/03/2022.
//

//new clothing item form
/*This code's logic is from DesignCode's "Build a Recipe App from scratch with SwiftUI - Part 1", as well as part 2
 Part of the code is from John Gallaugher's "Ch.8.22 Saving Images to Firebase Storage w/a Cloud Firestore Reference" video tutorial on YouTube
 Uploading the data is from a part of code from UTrend on GitHub
 Uploading the image is from Josh Kinney's 'Create an Image Picker, Access Camera and Photo Library in SwiftUI (NEW 2021)'
 video tutorial on YouTube
 Rest of the code is written by me*/
import SwiftUI
import Photos
import PhotosUI
import FirebaseAuth
import FirebaseStorage
import Firebase

struct NewClothesView: View {
    @EnvironmentObject var clothesViewModel: ClothesViewModel
    @ObservedObject private var viewModel = ClothesViewModel()
    
    @State private var name: String = ""
    @State private var selectedCategory: Category = Category.bag
    @State private var selectedColour: Colour = Colour.red
    @State private var pattern: String = ""
    @State private var clothingImage: String = ""
    @State private var navigateToClothingItem = false
    
    @State var addImage = false
    @State var openGallery = false
    @State var image = UIImage()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            
            Form {
                Section(header: Text("Name")) {
                    TextField("Item Name", text: $name)
                }
                
                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                    .accentColor(.purple)
                }
                
                Section(header: Text("Colour")) {
                    Picker("Colour", selection: $selectedColour) {
                        ForEach(Colour.allCases) { colour in
                            Text(colour.rawValue)
                                .tag(colour)
                        }
                    }
                    .pickerStyle(.menu)
                    .accentColor(.purple)
                }
                
                Section(header: Text("Pattern")) {
                    TextEditor(text: $pattern)
                }
                
                Section(header: Text("Image")) {
                    Button(action: {
                            addImage = true
                            openGallery = true
                        
                    }, label: {
                        Text("Add Image")
                            .foregroundColor(.purple)
                        //Josh Kinney
                        if addImage {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                        
                        })
                }
               

 
            }
            
            //from Josh Kinney
            .sheet(isPresented: $openGallery) {
                ImagePickerModel(selectedImage: $image, sourceType: .photoLibrary)
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
                    NavigationLink(isActive: $navigateToClothingItem) {
                        HomeView()
                    } label: {
                        Button {
                            uploadItem()
                            navigateToClothingItem = true

                        } label: {
                            Label("Save", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                        }
                    }
                    .disabled(name.isEmpty)
                }
            })
            .navigationTitle("New Clothing Item")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

struct NewClothesView_Previews: PreviewProvider {
    static var previews: some View {
        NewClothesView()
            .environmentObject(ClothesViewModel())
    }
}

extension NewClothesView{

    //From UTrend on GitHub
    private func uploadItem() {
        let photoData = image.jpegData(compressionQuality: 0.5)
        let user = Auth.auth().currentUser?.uid
        let db = Firestore.firestore()
        let photoName = UUID().uuidString
        let ref = Storage.storage().reference().child("users").child(user!).child("clothes")
        
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
                
                db.collection("users").document(user!).collection("clothes").addDocument(data: ["imgName": imageURL ,"name": name, "pattern": pattern, "category": selectedCategory.rawValue, "colour": selectedColour.rawValue])
                
            })
        }

    }
    
}


