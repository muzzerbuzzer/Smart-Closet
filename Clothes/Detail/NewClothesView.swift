//
//  NewClothesView.swift
//  disso
//
//  Created by Nika Pakravan on 16/03/2022.
//

import SwiftUI
import Photos
import PhotosUI

struct NewClothesView: View {
    @EnvironmentObject var clothesViewModel: ClothesViewModel
    
    @State private var name: String = ""
    @State private var selectedCategory: Category = Category.bag
    @State private var selectedColour: Colour = Colour.red
    @State private var pattern: String = ""
    //@State private var image: String = ""
    @State private var navigateToClothingItem = false
    
    @State var addImage = false
    @State var openGallery = false
    //@State var imageChosen = UIImage()
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
                        if addImage {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                        
                        })
                }
               

 
            }
            
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
                        ClothesView(clothes: clothesViewModel.closet.sorted {
                            $0.dateAdded < $1.dateAdded} [1])
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Button {
                            saveItem()
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
    private func saveItem() {
        let now = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let dateAdded = dateFormatter.string(from: now)
        print (dateAdded)
        
        let clothes = Clothes(name: name, image: image, colour: selectedColour.rawValue, pattern: pattern, category: selectedCategory.rawValue, dateAdded: dateAdded)
        
        clothesViewModel.addClothes(clothes: clothes)
    }
    
}

