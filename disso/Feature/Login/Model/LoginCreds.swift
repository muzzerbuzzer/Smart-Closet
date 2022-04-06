//
//  LoginCreds.swift
//  disso
//
//  Created by Nika Pakravan on 06/04/2022.
//

import Foundation

struct LoginCreds {
    var email: String
    var password: String
}

extension LoginCreds {
    
    static var new: LoginCreds {
        LoginCreds(email: "", password: "")
    }
    
}

