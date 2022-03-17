//
//  NewClothesView.swift
//  disso
//
//  Created by Nika Pakravan on 16/03/2022.
//

import SwiftUI

struct NewClothesView: View {
    @EnvironmentObject var clothesViewModel: ClothesViewModel
    
    @State private var name: String = ""
    @State private var selectedCategory: Category = Category.other
    @State private var colour: String = ""
    @State private var pattern: String = ""
    @State private var navigateToClothingItem = false
    
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
                }
                
                Section(header: Text("Colour")) {
                    TextEditor(text: $colour)
                }
                
                Section(header: Text("Pattern")) {
                    TextEditor(text: $pattern)
                }

            }
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
                    NavigationLink(isActive: $navigateToClothingItem) {
                        ClothesView(clothes: clothesViewModel.clothes.sorted{ $0.dateAdded > $1.dateAdded} [0])
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

extension NewClothesView {
    private func saveItem() {
        let now = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let dateAdded = dateFormatter.string(from: now)
        print (dateAdded)
        
        let clothes = Clothes(name: name, image: "", colour: colour, pattern: pattern, category: selectedCategory.rawValue, dateAdded: dateAdded)
        
        clothesViewModel.addClothes(clothes: clothes)
    }
}
