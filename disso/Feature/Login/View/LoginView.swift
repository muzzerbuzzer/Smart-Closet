//
//  LoginView.swift
//  disso
//
//  Created by Nika Pakravan on 03/04/2022.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        
        VStack(spacing: 16) {
            
            VStack(spacing: 16) {
                InputTextFieldView(text: .constant(""),
                                   placeholder: "Email",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "envelope")
                
                InputPasswordView(password: .constant(""),
                                  placeholder: "Password",
                                  sfSymbol: "lock")
            }
            
            HStack {
                Spacer()
                Button(action: {
                    //forgot password
                }, label: {
                    Text("Forgot Password?")
                        .foregroundColor(.purple)
                })
                .font(.system(size: 16, weight: .bold))
            }
            
            VStack(spacing: 16) {
                
                ButtonComponentView(title: "Login") {
                    //handler here
                }
                
                ButtonComponentView(title: "Register",
                                    background: .clear,
                                    foreground: .purple,
                                    border: .purple) {
                                    //handler
                }
            }
            
        }
        
        .padding(.horizontal, 15)
        .navigationTitle("Login")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }

    }
}
