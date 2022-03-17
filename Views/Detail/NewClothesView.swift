//
//  NewClothesView.swift
//  disso
//
//  Created by Nika Pakravan on 16/03/2022.
//

import SwiftUI

struct NewClothesView: View {
    @State private var name: String = ""
    @State private var selectedCategory: Category = Category.other
    @State private var colour: String = ""
    @State private var pattern: String = ""
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
                        
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                
                ToolbarItem {
                    Button {
                        
                    } label: {
                        Label("Save", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
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
    }
}
