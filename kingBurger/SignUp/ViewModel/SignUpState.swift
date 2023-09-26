//
//  SignUpState.swift
//  kingBurger
//
//  Created by Daniel Makowiesky on 25/09/23.
//

import Foundation

enum SignUpState {
    case none
    case loading
    case goToHome
    case error(String)
}
