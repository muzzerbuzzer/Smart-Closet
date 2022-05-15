//
//  PreviewLayoutComponentModifier.swift
//  disso
//
//  Created by Nika Pakravan on 03/04/2022.
//

//Allows for a layout component to be previewed without having to re-write the code multiple times
/*This code has been re-used from tundsdev's
 'Firebase SwiftUI Auth, Login, Registration, Password Reset, Sign Out - Bug Fix In Description' video tutorial on YouTube*/
import SwiftUI

struct PreviewLayoutComponentModifier: ViewModifier {
    
        let name: String
        
        func body(content: Content) -> some View {
            
            content
                .previewLayout(.sizeThatFits)
                .previewDisplayName(name)
                .padding()
    
    }
}

extension View {
    
    func preview(with name: String) -> some View {
        self.modifier(PreviewLayoutComponentModifier(name: name))
    }
}
