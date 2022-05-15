//
//  SessionUserDetails.swift
//  disso
//
//  Created by Nika Pakravan on 05/04/2022.
//

//Model for the current user details
/*This code has been re-used from tundsdev's
 'Firebase SwiftUI Auth, Login, Registration, Password Reset, Sign Out - Bug Fix In Description' video tutorial on YouTube*/
import Foundation

struct SessionUserDetails {
    //constants because it is being used to push out the user detials for the current session 
    let firstName: String
    let lastName: String
}
