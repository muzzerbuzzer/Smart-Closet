//
//  LoginCreds.swift
//  disso
//
//  Created by Nika Pakravan on 06/04/2022.
//

//model for login service
/*This code has been re-used from tundsdev's
 'Firebase SwiftUI Auth, Login, Registration, Password Reset, Sign Out - Bug Fix In Description' video tutorial on YouTube*/
import Foundation

//info required for login
struct LoginCreds {
    var email: String
    var password: String
}

extension LoginCreds {
    
    //both strings
    static var new: LoginCreds {
        LoginCreds(email: "", password: "")
    }
    
}

