//
//  RegisterView.swift
//  disso
//
//  Created by Nika Pakravan on 04/04/2022.
//

import SwiftUI

struct SignUpView: View {
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 32) {
                
                VStack(spacing: 16) {
                    
                    InputTextFieldView(text: .constant(""),
                                       placeholder: "Email",
                                       keyboardType: .emailAddress,
                                       sfSymbol: "envelope")
                    
                    InputPasswordView(password: .constant(""),
                                      placeholder: "Password",
                                      sfSymbol: "lock")
                    
                    Divider()
                    
                    InputTextFieldView(text: .constant(""),
                                       placeholder: "First Name",
                                       keyboardType: .namePhonePad,
                                       sfSymbol: nil)
                    
                    InputTextFieldView(text: .constant(""),
                                       placeholder: "Last Name",
                                       keyboardType: .namePhonePad,
                                       sfSymbol: nil)
                }
                
                ButtonComponentView(title: "Sign Up") {
                    //handle create action here
                }
            }
            .padding(.horizontal, 15)
            .navigationTitle("Sign Up")
            .applyClose()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
