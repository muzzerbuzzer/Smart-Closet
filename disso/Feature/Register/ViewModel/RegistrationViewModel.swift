//
//  RegistrationViewModel.swift
//  disso
//
//  Created by Nika Pakravan on 05/04/2022.
//

//ViewModel for the user creation details to help transform the information from the model and converts them into values that can be displayed on the view
/*This code has been re-used from tundsdev's
 'Firebase SwiftUI Auth, Login, Registration, Password Reset, Sign Out - Bug Fix In Description' video tutorial on YouTube*/
import Foundation
import Combine

//cases for the registration state
enum RegistrationState {
    case successfull
    case failed(error: Error)
    case na
}

//properties necessary for registering 
protocol RegistrationViewModel {
    func register()
    var hasError: Bool { get }
    var service: RegistrationService { get }
    var state: RegistrationState { get }
    var userDetails: AccountDetails { get }
    init(service: RegistrationService)
}

final class RegistrationViewModelImpl: ObservableObject, RegistrationViewModel {
    
    @Published var hasError: Bool = false
    @Published var state: RegistrationState = .na
    
    let service: RegistrationService
    
    @Published var userDetails: AccountDetails = AccountDetails.new
    
    private var subscriptions = Set<AnyCancellable>()
    
    //initialising registration service
    init(service: RegistrationService) {
        self.service = service
        setupErrorSubscriptions()
    }
    
    // user details are going to be binded to the view, that's why they are not being passed here
    func register() {
        
        service
            .register(with: userDetails)
            .sink { [weak self] res in
                
                switch res {
                case .failure(let error):
                    self?.state = .failed(error: error)
                default: break
                }
                
            } receiveValue: { [weak self] in
                self?.state = .successfull
            }
            .store(in: &subscriptions)
    }
    
}

private extension RegistrationViewModelImpl {
    
    //error handling
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

