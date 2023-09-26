//
//  SignInViewModel.swift
//  kingBurger
//
//  Created by Daniel Makowiesky on 25/09/23.
//

import Foundation

protocol SignUpViewModelDelegate {
    func viewModelDidChanged(state: SignUpState)
}

class SignUpViewModel {
    
    var delegate: SignUpViewModelDelegate?
    var coordinator: SignUpCoordinator?
    
    var state: SignUpState = .none {
        didSet {
            delegate?.viewModelDidChanged(state: state)
            print("state mudou")
        }
    }
    
    func send(){
        state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.state = .error("Erro interno no servidor")
        }
    }
}

