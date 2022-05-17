//
//  AddOutfitToCalendarView.swift
//  disso
//
//  Created by Nika Pakravan on 01/05/2022.
//

//code for add to calendar form
/*This code has been written by the author, with assistance from the imagePickerModel by Josh Kinney
*/
import Foundation
import SwiftUI
import Photos
import PhotosUI

struct AddOutfittoCalendarView: View {
    @EnvironmentObject var calendarViewModel: CalendarViewModel
    
    @State private var name: String = ""
    @State private var outfitImage = UIImage()
    
    @State var addImage = false
    @State var openGallery = false
    
    @State private var navigateToCalendar = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            
            //form to add information
            Form {
                Section(header: Text("Name")) {
                    TextField("Item Name", text: $name)
                }
                
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
            
            //sheet to show gallery so user can choose outfit image. code logic is from Josh Kinney

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
                
                //done button
                ToolbarItem {
                    NavigationLink(isActive: $navigateToCalendar) {
                        CalendarHomeView()
                    } label: {
                        Button {
                            let task = Task(title: name, outfit: outfitImage)
                            //calendarViewModel.addTask(task)
                            
                            navigateToCalendar = true
                        } label: {
                            Label("Save", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                                .foregroundColor(.purple)
                        }
                    }
                }
    
            })
            .navigationTitle("Add Outfit to Calendar")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

struct AddOutfittoCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        AddOutfittoCalendarView()
            .environmentObject(CalendarViewModel())
    }
}
