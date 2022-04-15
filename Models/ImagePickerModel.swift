//
//  ImagePickerModel.swift
//  disso
//
//  Created by Nika Pakravan on 14/04/2022.
//

import SwiftUI
import UIKit

struct ImagePickerModel: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode
    
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerModel>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
        
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        //leave alone for rn
        
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
         
        var parent: ImagePickerModel
        
        //initialising parent here
        init(_ parent: ImagePickerModel) {
            self.parent = parent
        }
        
        //didFinishPickingMediaWithInfo is when the image is picked, and this is what happens after
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           
            /*image is wrapped as a UIImage, and then saving as image
            which is then grabbed and then saved in NewClothesView as the image*/
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            
            //dismisses sheet when all is completed
            parent.presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}
