//
//  ResetPasswordView.swift
//  disso
//
//  Created by Nika Pakravan on 05/04/2022.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 16) {
                
                Text("Enter the email address associated with your account and we'll send an email to help reset your password!")
                
                InputTextFieldView(text: .constant(""),
                                   placeholder: "Email",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "envelope")
                
                ButtonComponentView(title: "Submit"){
                    //handle password reset action
                    presentationMode.wrappedValue.dismiss()
                }
                
            }
            .padding(.horizontal, 16)
            .navigationTitle("Reset Password")
            .applyClose()
        }
        
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
