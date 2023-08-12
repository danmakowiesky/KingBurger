//
//  SignInViewController.swift
//  kingBurger
//
//  Created by Daniel Makowiesky on 11/08/23.
//

import Foundation
import UIKit

class SignInViewController: UIViewController {
    let email: UITextField = {
        let emailInput = UITextField()
        emailInput.backgroundColor = UIColor.white
        emailInput.placeholder = "Entre com seu e-mail"
        emailInput.placeholder = "Entre com seu e-mail"
        return emailInput
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        view.addSubview(email)
        email.frame = CGRect(x:0, y: view.bounds.size.height / 2, width: view.bounds.size.height, height: 50)
    }
}
