//
//  ForgotPasswordViewModel.swift
//  disso
//
//  Created by Nika Pakravan on 06/04/2022.
//

import Combine
import Foundation

protocol ForgotPasswordViewModel {
    func sendPasswordReset()
    var service: ForgotPasswordService { get }
    var email: String { get }
    init(service: ForgotPasswordService)
}

final class ForgotPasswordViewModelImpl: ObservableObject, ForgotPasswordViewModel {
    
    @Published var email: String = ""
    
    let service: ForgotPasswordService
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: ForgotPasswordService) {
        self.service = service
    }
    
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
