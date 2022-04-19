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
    @State private var showCategories = false
    
    var body: some View {
        NavigationView {
            Text("beep boop")
            
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Label("Cancel", systemImage: "xmark")
                                .labelStyle(.iconOnly)
                        }
                    }
                    
                    ToolbarItem {
                        Button {
                            showCategories = true
                        } label: {
                            Label("Add", systemImage: "plus")
                                .labelStyle(.iconOnly)
                        }
                    }
                    

                
                     
                    /*ToolbarItem {
                        NavigationLink(isActive: $navigateToClothingItem) {
                            ClothesView(clothes: clothesViewModel.closet.sorted{ $0.dateAdded < $1.dateAdded} [1])
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
                    }*/
                })
            
                .navigationTitle("New Outfit")
                .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $showCategories) {
           CategoriesView()
        .navigationViewStyle(.stack)
        }
    }
}

struct NewOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        NewOutfitView()
    }
}

