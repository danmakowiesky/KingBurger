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
        emailInput.translatesAutoresizingMaskIntoConstraints = false
        emailInput.backgroundColor = UIColor.white
        emailInput.layer.cornerRadius = 6
        emailInput.layer.borderWidth = 1
        emailInput.layer.borderColor = UIColor(red: 0.867, green: 0.871, blue: 0.873, alpha: 1).cgColor
        emailInput.layer.contents =
        emailInput.placeholder = "Entre com seu e-mail"
        return emailInput
    }()
    let password: UITextField = {
        let passwordInput = UITextField()
        passwordInput.translatesAutoresizingMaskIntoConstraints = false
        passwordInput.backgroundColor = UIColor.white
        passwordInput.layer.cornerRadius = 6
        passwordInput.layer.borderWidth = 1
        passwordInput.layer.borderColor = UIColor(red: 0.867, green: 0.871, blue: 0.873, alpha: 1).cgColor
        passwordInput.placeholder = "Digite sua senha"
        return passwordInput
    }()
    lazy var sendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(sendDidTap), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Criar Conta", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(registerDidTap), for: .touchUpInside)
        return button
    }()
    
    var viewModel: SignInViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
   
    //definição de layouy
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(email)
        let emailConstraints = [
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
            email.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
            email.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100.0),
            email.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        view.addSubview(password)
        let passwordConstraints = [
            password.leadingAnchor.constraint(equalTo: email.leadingAnchor),
            password.trailingAnchor.constraint(equalTo: email.trailingAnchor),
            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10.0),
            password.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        view.addSubview(sendButton)
        let buttonConstraints = [
            sendButton.leadingAnchor.constraint(equalTo: password.leadingAnchor),
            sendButton.trailingAnchor.constraint(equalTo: password.trailingAnchor),
            sendButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10.0),
            sendButton.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        view.addSubview(registerButton)
        let registerButtonConstraints = [
            registerButton.leadingAnchor.constraint(equalTo: email.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: email.trailingAnchor),
            registerButton.topAnchor.constraint(equalTo: sendButton.bottomAnchor, constant: 10.0),
            registerButton.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        NSLayoutConstraint.activate(emailConstraints)
        NSLayoutConstraint.activate(passwordConstraints)
        NSLayoutConstraint.activate(buttonConstraints)
        NSLayoutConstraint.activate(registerButtonConstraints)

    }
    
    //evento de touch
    @objc func sendDidTap(_ sender: UIButton){
        viewModel?.send()
    }
    
    @objc func registerDidTap(_ sender: UIButton){
        viewModel?.goToSignUp()
    }
    
}
//separado em extension para verificar o observador. questão apenas de organização.
extension SignInViewController: SignInViewModelDelegate {
    //observador ( qualquer mudança de status do view Model)
    func viewModelDidChanged(state: SignInState) {
        switch state {
        case .none:
            break
        case .loading:
            break
        case .goToHome:
            //navega tela principal
            break
        case .error(let message):
            let alert = UIAlertController(title: "ERRO", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:  "OK", style: .default))
            self.present(alert, animated: true)
            break
        }
        print("View Model notificou com o state: \(state)")
    }
}
