//
//  ResetPasswordView.swift
//  disso
//
//  Created by Nika Pakravan on 05/04/2022.
//

//view that combines the forgot password service and model to allow users to reset their password if they wish. represents the GUI
/*This code has been re-used from tundsdev's
 'Firebase SwiftUI Auth, Login, Registration, Password Reset, Sign Out - Bug Fix In Description' video tutorial on YouTube*/
import SwiftUI

struct ResetPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var vm = ForgotPasswordViewModelImpl(service: ForgotPasswordServiceImpl())
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 16) {
                
                Text("Enter the email address associated with your account and we'll send an email to help reset your password!")
                
                //text field for the email
                InputTextFieldView(text: $vm.email,
                                   placeholder: "Email",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "envelope")
                
                //button allows users to submit the information
                ButtonComponentView(title: "Submit"){
                    vm.sendPasswordReset()
                    presentationMode.wrappedValue.dismiss()
                }
                
            }
            .padding(.horizontal, 16)
            .navigationTitle("Reset Password")
            //close modifier
            .applyClose()
        }
        
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
