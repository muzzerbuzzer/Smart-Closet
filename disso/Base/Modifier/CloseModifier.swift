//
//  CloseModifier.swift
//  disso
//
//  Created by Nika Pakravan on 05/04/2022.
//

import SwiftUI

struct CloseModifier: ViewModifier {
    
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        
        content
            .toolbar {
                Button(action: {
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
