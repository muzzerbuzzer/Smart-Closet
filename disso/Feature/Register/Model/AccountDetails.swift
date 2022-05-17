//
//  AccountDetails.swift
//  disso
//
//  Created by Nika Pakravan on 05/04/2022.
//

//account details for each user
/*This code has been re-used from tundsdev's
 'Firebase SwiftUI Auth, Login, Registration, Password Reset, Sign Out - Bug Fix In Description' video tutorial on YouTube*/
import Foundation

//information required for each account
struct AccountDetails {
    var email: String
    var password: String
    var firstName: String
    var lastName: String
}

extension AccountDetails {
    
    //all strings
    static var new: AccountDetails {
        AccountDetails(email: "",
                       password: "",
                       firstName: "",
                       lastName: "")
        
        
    }
    
}
