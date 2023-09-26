//
//  SignUpCoordinator.swift
//  kingBurger
//
//  Created by Daniel Makowiesky on 25/09/23.
//

import Foundation
import UIKit

class SignUpCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let signUpVC = SignUpViewController()
        navigationController.pushViewController(signUpVC, animated: true)
    }
    
}
