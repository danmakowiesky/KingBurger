//
//  SignInCoordinator.swift
//  kingBurger
//
//  Created by Daniel Makowiesky on 25/09/23.
//

import Foundation
import UIKit

class SignInCoordinator {
    private let window: UIWindow?
    private let navigationController: UINavigationController
    
    init(window: UIWindow?) {
        self.window = window
        self.navigationController = UINavigationController()
        
    }
    
    func start(){
        let viewModel = SignInViewModel()
        let signInVC = SignInViewController()
        signInVC.viewModel = viewModel
        
        //rootViewContorller
        navigationController.pushViewController(signInVC, animated: true)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }
}
