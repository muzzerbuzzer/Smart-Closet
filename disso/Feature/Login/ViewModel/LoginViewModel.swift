//
//  LoginViewModel.swift
//  disso
//
//  Created by Nika Pakravan on 06/04/2022.
//

//ViewModel for the login details to help transform the information from the model and converts them into values that can be displayed on the view
/*This code has been re-used from tundsdev's
 'Firebase SwiftUI Auth, Login, Registration, Password Reset, Sign Out - Bug Fix In Description' video tutorial on YouTube*/
import Foundation
import Combine
import UIKit

//login state info
enum LoginState {
    case successfull
    case failed(error: Error)
    case na
}

//info required for login
protocol LoginViewModel {
    func login()
    var service: LoginService { get }
    var state: LoginState { get }
    var credentials: LoginCreds { get }
    var hasError: Bool { get }
    init(service: LoginService)
}

final class LoginViewModelImpl: ObservableObject, LoginViewModel {
    
    @Published var hasError: Bool = false
    @Published var state: LoginState = .na
    @Published var credentials: LoginCreds = LoginCreds.new
    
    private var subscriptions = Set<AnyCancellable>()
    
    let service: LoginService
    
    init(service: LoginService) {
        self.service = service
        setupErrorSubscriptions()
    }
    
    //login function that will be re-used in the view
    func login() {
        service
            .login(with: credentials)
            .sink { res in
                
                //error handling
                switch res {
                case .failure(let err):
                    self.state = .failed(error: err)
                default: break
                }
                
            } receiveValue: { [weak self] in
                self?.state = .successfull
            }
            .store(in: &subscriptions)
    }
    
}

private extension LoginViewModelImpl {
    
    //error handling for login 
    func setupErrorSubscriptions() {
        
        $state
            .map { state -> Bool in
                switch state {
                case .successfull,
                     .na:
                    return false
                case .failed:
                    return true
                }
            }
            .assign(to: &$hasError)
    }
    
}
