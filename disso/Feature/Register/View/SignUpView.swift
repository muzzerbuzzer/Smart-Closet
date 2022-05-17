//
//  RegisterView.swift
//  disso
//
//  Created by Nika Pakravan on 04/04/2022.
//

//sign up view
/*This code has been re-used from tundsdev's
 'Firebase SwiftUI Auth, Login, Registration, Password Reset, Sign Out - Bug Fix In Description' video tutorial on YouTube*/
import SwiftUI

struct SignUpView: View {
    
    @StateObject private var vm = RegistrationViewModelImpl(
        service: RegistrationServiceImpl()
    )
    
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 32) {
                
                VStack(spacing: 16) {
                    
                    //text fields for putting in information
                    InputTextFieldView(text: $vm.userDetails.email,
                                       placeholder: "Email",
                                       keyboardType: .emailAddress,
                                       sfSymbol: "envelope")
                    
                    //password text field does not show the text
                    InputPasswordView(password: $vm.userDetails.password,
                                      placeholder: "Password",
                                      sfSymbol: "lock")
                    
                    Divider()
                    
                    InputTextFieldView(text: $vm.userDetails.firstName,
                                       placeholder: "First Name",
                                       keyboardType: .namePhonePad,
                                       sfSymbol: nil)
                    
                    InputTextFieldView(text: $vm.userDetails.lastName,
                                       placeholder: "Last Name",
                                       keyboardType: .namePhonePad,
                                       sfSymbol: nil)
                }
                
                //when button pressed user has signed up
                ButtonComponentView(title: "Sign Up") {
                    vm.register()
                }
            }
            .padding(.horizontal, 15)
            .navigationTitle("Sign Up")
            //close modifier
            .applyClose()
            //error handling
            .alert(isPresented: $vm.hasError,
                   content: {
            
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
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
