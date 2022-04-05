//
//  LoginView.swift
//  disso
//
//  Created by Nika Pakravan on 03/04/2022.
//


//for the buttons - register & forgot password, its placed both in a stack & not outside just in case someone has an older version of ios (14 & below) so that there are no bugs
import SwiftUI

struct LoginView: View {
    
    @State private var showRegistration = false
    @State private var showForgotPassword = false
    
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
                    showForgotPassword.toggle()
                }, label: {
                    Text("Forgot Password?")
                        .foregroundColor(.purple)
                })
                .font(.system(size: 16, weight: .bold))
                .sheet(isPresented: $showForgotPassword,
                       content: {
                    ResetPasswordView()
                })
            }
            
            VStack(spacing: 16) {
                
                ButtonComponentView(title: "Login") {
                    //handler here
                }
                
                ButtonComponentView(title: "Register",
                                    background: .clear,
                                    foreground: .purple,
                                    border: .purple) {
                    showRegistration.toggle()
                }
                .sheet(isPresented: $showRegistration,
                       content: {
                    SignUpView()
                })
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
