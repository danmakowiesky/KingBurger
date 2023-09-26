//
//  SignInViewModel.swift
//  kingBurger
//
//  Created by Daniel Makowiesky on 25/09/23.
//

import Foundation

protocol SignInViewModelDelegate {
    func viewModelDidChanged(state: SignInState)
}

class SignInViewModel {
    
    var delegate: SignInViewModelDelegate?
    
    var state: SignInState = .none {
        didSet {
            delegate?.viewModelDidChanged(state: state)
            print("state mudou")
        }
    }
    
    func send(){
        state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.state = .error("Usuário não existe")
        }
    }
    
    func register(){
        state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.state = .error("Usuário não existe")
        }
    }
    
}
