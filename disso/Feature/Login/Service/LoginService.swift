//
//  LoginService.swift
//  disso
//
//  Created by Nika Pakravan on 06/04/2022.
//

//login service which will be used in the view (with the help of the viewModel) to allow users to login
/*This code has been re-used from tundsdev's
 'Firebase SwiftUI Auth, Login, Registration, Password Reset, Sign Out - Bug Fix In Description' video tutorial on YouTube*/
import Foundation
import Combine
import FirebaseAuth

protocol LoginService {
    func login(with credentials: LoginCreds) -> AnyPublisher<Void, Error>
}

final class LoginServiceImpl: LoginService {
 
    func login(with credentials: LoginCreds) -> AnyPublisher<Void, Error> {
        
        Deferred {
            
            Future { promise in
                
                //getting info from Firebase to login
                Auth
                    .auth()
                    .signIn(withEmail: credentials.email,
                            password: credentials.password) { res, error in
                        
                        //error handling
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            promise(.success(()))
                        }
                        
                    }
                
            }
            
        }
        //delays closure
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
        
    }
    
}
