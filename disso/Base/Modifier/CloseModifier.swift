//
//  CloseModifier.swift
//  disso
//
//  Created by Nika Pakravan on 05/04/2022.
//

//Allows for a view to be closed and returned to the previous view without having to re-write the code multiple times
/*This code has been re-used from tundsdev's
 'Firebase SwiftUI Auth, Login, Registration, Password Reset, Sign Out - Bug Fix In Description' video tutorial on YouTube*/
import SwiftUI

struct CloseModifier: ViewModifier {
    
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        
        content
            .toolbar {
                Button(action: {
                    //dismisses view being presented
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.purple)
                })
            }
        
    }
}

extension View{
    
    func applyClose() -> some View {
        self.modifier(CloseModifier())
    }
}
