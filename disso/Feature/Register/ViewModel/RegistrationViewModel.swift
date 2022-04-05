//
//  RegistrationViewModel.swift
//  disso
//
//  Created by Nika Pakravan on 05/04/2022.
//

import Foundation
import Combine

enum RegistrationState {
    case successful
    case failed(error: Error)
    case na
}

protocol RegistrationViewModel {
    func register()
    var service: RegistrationService { get }
    var state: RegistrationState { get }
    var userDetails: AccountDetails { get }
    init(service: RegistrationService)
}
