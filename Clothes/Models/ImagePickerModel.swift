//
//  ImagePickerModel.swift
//  disso
//
//  Created by Nika Pakravan on 14/04/2022.
//

import SwiftUI
import UIKit
import FirebaseStorage
import FirebaseAuth

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
           
            /*guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
                  let url = URL(string: urlString) else {
                        return
            }
            
            let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
            })*/
                
            /*image is wrapped as a UIImage, and then saving as image
            which is then grabbed and then saved in NewClothesView as the image*/
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            
            //dismisses sheet when all is completed
            parent.presentationMode.wrappedValue.dismiss()
            
            let reference = Storage.storage().reference().child("clothesImages/\(Auth.auth().currentUser?.uid ?? "")/item.png")
            var data = NSData()
            data = parent.selectedImage.jpegData(compressionQuality: 0.8)! as NSData
            
            let metaData = StorageMetadata()
            metaData.contentType = "image/png"
            
            //let reference = Storage.storage().reference().child("clothesImage/item.jpg")
            
            reference.putData(data as Data, metadata: metaData) { (metadata, error) in
                if error == nil {
                    reference.downloadURL(completion: { (url, error) in
                        print("Done, URL is \(String(describing: url))")
                    })
                } else {
                    print("Error \(String(describing: error))")
                }
            }
            
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}
