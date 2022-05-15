//
//  InputPasswordView.swift
//  disso
//
//  Created by Nika Pakravan on 03/04/2022.
//

//Input password text field without having to re-write the code multiple times
/*This code has been re-used from tundsdev's
 'Firebase SwiftUI Auth, Login, Registration, Password Reset, Sign Out - Bug Fix In Description' video tutorial on YouTube*/
import SwiftUI

struct InputPasswordView: View {
    
    @Binding var password: String
    let placeholder: String
    let sfSymbol: String?
    
    private let textFieldLeading: CGFloat = 30 
    
    var body: some View {
        
        //uses secureField so that when password is being typed it is not shown as text
        SecureField(placeholder, text: $password)
            .frame(maxWidth: .infinity,
                    minHeight: 44)
            .padding(.leading, sfSymbol == nil ? textFieldLeading / 2 : textFieldLeading)
            .background(
            
                ZStack(alignment: .leading) {
                    
                    //adds sfSymbol to the password box
                    if let systemImage =  sfSymbol {
                        
                        Image(systemName: systemImage)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 5)
                            .foregroundColor(Color.gray.opacity(0.5))
                    }
                    
                    RoundedRectangle(cornerRadius: 10,
                                     style: .continuous)
                    .stroke(Color.gray.opacity(0.25))
                }
            
            )
    }
}

struct InputPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        InputPasswordView(password: .constant(""),
                          placeholder: "Password",
                          sfSymbol: "lock")
            .preview(with: "Input password with sfSymbol")
        
        InputPasswordView(password: .constant(""),
                          placeholder: "Password",
                          sfSymbol: nil)
            .preview(with: "Input password without sfSymbol")
    }
}
