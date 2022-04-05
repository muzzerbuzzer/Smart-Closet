//
//  AccountDetails.swift
//  disso
//
//  Created by Nika Pakravan on 05/04/2022.
//

import Foundation

struct AccountDetails {
    var email: String
    var password: String
    var firstName: String
    var lastName: String
}

extension AccountDetails {
    
    static var new: AccountDetails {
        AccountDetails(email: "",
                       password: "",
                       firstName: "",
                       lastName: "")
        
        
    }
    
}
