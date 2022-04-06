//
//  LoginService.swift
//  disso
//
//  Created by Nika Pakravan on 06/04/2022.
//

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
                
                Auth
                    .auth()
                    .signIn(withEmail: credentials.email,
                            password: credentials.password) { res, error in
                        
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            promise(.success(()))
                        }
                        
                    }
                
            }
            
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
        
    }
    
}
