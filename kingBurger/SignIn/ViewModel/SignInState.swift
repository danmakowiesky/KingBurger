//
//  SignInState.swift
//  kingBurger
//
//  Created by Daniel Makowiesky on 25/09/23.
//

import Foundation

enum SignInState {
    case none
    case loading
    case goToHome
    case error(String)
}
