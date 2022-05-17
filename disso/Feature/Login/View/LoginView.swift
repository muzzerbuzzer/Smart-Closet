//
//  LoginView.swift
//  disso
//
//  Created by Nika Pakravan on 03/04/2022.
//

//view for login service - uses the viewmodel, service, and model
/*This code has been re-used from tundsdev's
 'Firebase SwiftUI Auth, Login, Registration, Password Reset, Sign Out - Bug Fix In Description' video tutorial on YouTube*/

//for the buttons - register & forgot password, its placed both in a stack & not outside just in case someone has an older version of ios (14 & below) so that there are no bugs
import SwiftUI

struct LoginView: View {
    
    @State private var showRegistration = false
    @State private var showForgotPassword = false
    
    @StateObject private var vm = LoginViewModelImpl(service: LoginServiceImpl())
    
    var body: some View {
        
        VStack(spacing: 16) {
            
            VStack(spacing: 16) {
                //text field for email
                InputTextFieldView(text: $vm.credentials.email,
                                   placeholder: "Email",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "envelope")
                
                //text field for password(wont be able to see the text)
                InputPasswordView(password: $vm.credentials.password,
                                  placeholder: "Password",
                                  sfSymbol: "lock")
            }
            
            HStack {
                Spacer()
                //forgot password button to go to that view
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
                
                //will login
                ButtonComponentView(title: "Login") {
                    vm.login()
                }
                
                //redirects users to the register view
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
        .alert(isPresented: $vm.hasError,
               content: {
        
                //error handling
                if case .failed(let error) = vm.state {
                    return Alert(
                        title: Text("Error"),
                        message: Text(error.localizedDescription))
                } else {
                    return Alert(
                        title: Text("Error"),
                        message: Text("Something went wrong"))
                }
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }

    }
}
