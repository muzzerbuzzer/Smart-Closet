//
//  LoginViewModel.swift
//  disso
//
//  Created by Nika Pakravan on 06/04/2022.
//

import Foundation
import Combine
import UIKit

enum LoginState {
    case successfull
    case failed(error: Error)
    case na
}

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
    
    func login() {
        service
            .login(with: credentials)
            .sink { res in
                
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
