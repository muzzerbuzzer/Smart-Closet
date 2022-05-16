//
//  ForgotPasswordViewModel.swift
//  disso
//
//  Created by Nika Pakravan on 06/04/2022.
//

//ViewModel for the current user details to help transform the information from the model and converts them into values that can be displayed on the view
/*This code has been re-used from tundsdev's
 'Firebase SwiftUI Auth, Login, Registration, Password Reset, Sign Out - Bug Fix In Description' video tutorial on YouTube*/
import Combine
import Foundation

protocol ForgotPasswordViewModel {
    func sendPasswordReset()
    var service: ForgotPasswordService { get }
    var email: String { get }
    init(service: ForgotPasswordService)
}

//creates the viewmodel as an observable object so that it can be used in other views
final class ForgotPasswordViewModelImpl: ObservableObject, ForgotPasswordViewModel {
    
    @Published var email: String = ""
    
    let service: ForgotPasswordService
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: ForgotPasswordService) {
        self.service = service
    }
    
    //code can be found on Firebase website which allows reset passwrd email
    //to be sent to users
    func sendPasswordReset() {
        
        //not weak because not capturing self 
        service
            .sendPasswordReset(to: email)
            .sink { res in
                
                switch res {
                case .failure(let err):
                    print("Failed: \(err)")
                default: break
                }
                
            } receiveValue: {
                print("Password reset request sent!")
            }
            .store(in: &subscriptions)
    }
}
