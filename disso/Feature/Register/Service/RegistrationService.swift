//
//  RegistrationService.swift
//  disso
//
//  Created by Nika Pakravan on 05/04/2022.
//


//service for the user account creation to help create the account
/*This code has been re-used from tundsdev's
 'Firebase SwiftUI Auth, Login, Registration, Password Reset, Sign Out - Bug Fix In Description' video tutorial on YouTube*/
import Foundation
import Combine
import Firebase
import FirebaseDatabase

//keys for registration
enum RegistrationKeys: String {
    case firstName
    case lastName
}

protocol RegistrationService {
    func register(with details: AccountDetails) -> AnyPublisher<Void, Error>
}

final class RegistrationServiceImpl: RegistrationService {
    
    func register(with details: AccountDetails) -> AnyPublisher<Void, Error> {
        
        Deferred {
            
            Future { promise in
                
                Auth.auth()
                    //from firebase website to create account with email & password
                    .createUser(withEmail: details.email,
                                password: details.password) { res, error in
                        
                        if let err = error {
                            promise(.failure(err))
                        } else {
                        
                            if let uid = res?.user.uid {
                                
                                let values = [RegistrationKeys.firstName.rawValue: details.firstName,
                                              RegistrationKeys.lastName.rawValue: details.lastName] as [String: Any]
                                
                                Database.database()
                                        .reference()
                                        .child("users")
                                        .child(uid)
                                        .updateChildValues(values) { error, ref in
                                            
                                            if let err = error {
                                                promise(.failure(err))
                                            } else {
                                                promise(.success(()))
                                            }
                                        }
                                
                            } else {
                                promise(.failure(NSError(domain: "Invalid User ID", code: 0, userInfo: nil)))
                            }
                            
                        }
                            
                    }
                
                
            }
            
        }
        //receive publisher on main thread
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
    
}
