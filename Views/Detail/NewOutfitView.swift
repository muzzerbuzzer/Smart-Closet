//
//  NewOutfitView.swift
//  disso
//
//  Created by Nika Pakravan on 11/04/2022.
//

import Foundation
import SwiftUI

struct NewOutfitView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var showCategories = false
    @State var addImage = false
    @State var image = UIImage()
    
    var body: some View {
        NavigationView {
                
            VStack {
            
            Text("beep boop")
            
            if addImage {
                Image(uiImage: image)
                    .resizable()
                    //.aspectRatio(contentMode: .fill)
                    .scaledToFit()
            }
            
        }
                .sheet(isPresented: $showCategories) {
                    ImagePickerModel(selectedImage: $image, sourceType: .photoLibrary)
                }
            
                .toolbar(content: {
                    /*ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Label("Cancel", systemImage: "xmark")
                                .labelStyle(.iconOnly)
                        }
                    }*/
                    
                    ToolbarItem {
                        Button {
                            addImage = true
                            showCategories = true
                            
                        } label: {
                            Label("Add", systemImage: "plus")
                                .labelStyle(.iconOnly)
                        }
                    }
                    
                })
            
            
            
            
                /*.navigationTitle("New Outfit")
                .navigationBarTitleDisplayMode(.inline)*/
        }
    }
}

struct NewOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        NewOutfitView()
    }
}

