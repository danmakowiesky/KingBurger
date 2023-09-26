//
//  SignUpViewController.swift
//  kingBurger
//
//  Created by Daniel Makowiesky on 25/09/23.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    let name: UITextField = {
        let nameInput = UITextField()
        nameInput.translatesAutoresizingMaskIntoConstraints = false
        nameInput.backgroundColor = UIColor.white
        nameInput.layer.cornerRadius = 6
        nameInput.layer.borderWidth = 1
        nameInput.layer.borderColor = UIColor(red: 0.867, green: 0.871, blue: 0.873, alpha: 1).cgColor
        nameInput.layer.contents =
        nameInput.placeholder = "Entre com seu nome"
        return nameInput
    }()
    let email: UITextField = {
        let emailInput = UITextField()
        emailInput.translatesAutoresizingMaskIntoConstraints = false
        emailInput.backgroundColor = UIColor.white
        emailInput.layer.cornerRadius = 6
        emailInput.layer.borderWidth = 1
        emailInput.layer.borderColor = UIColor(red: 0.867, green: 0.871, blue: 0.873, alpha: 1).cgColor
        emailInput.layer.contents =
        emailInput.placeholder = "Entre com seu E-mail"
        return emailInput
    }()
    let password: UITextField = {
        let passwordInput = UITextField()
        passwordInput.translatesAutoresizingMaskIntoConstraints = false
        passwordInput.backgroundColor = UIColor.white
        passwordInput.layer.cornerRadius = 6
        passwordInput.layer.borderWidth = 1
        passwordInput.layer.borderColor = UIColor(red: 0.867, green: 0.871, blue: 0.873, alpha: 1).cgColor
        passwordInput.layer.contents =
        passwordInput.placeholder = "Entre com sua senha"
        return passwordInput
    }()
    let document: UITextField = {
        let documentInput = UITextField()
        documentInput.translatesAutoresizingMaskIntoConstraints = false
        documentInput.backgroundColor = UIColor.white
        documentInput.layer.cornerRadius = 6
        documentInput.layer.borderWidth = 1
        documentInput.layer.borderColor = UIColor(red: 0.867, green: 0.871, blue: 0.873, alpha: 1).cgColor
        documentInput.layer.contents =
        documentInput.placeholder = "Entre com seu CPF"
        return documentInput
    }()
    let dob: UITextField = {
        let dobInput = UITextField()
        dobInput.translatesAutoresizingMaskIntoConstraints = false
        dobInput.backgroundColor = UIColor.white
        dobInput.layer.cornerRadius = 6
        dobInput.layer.borderWidth = 1
        dobInput.layer.borderColor = UIColor(red: 0.867, green: 0.871, blue: 0.873, alpha: 1).cgColor
        dobInput.layer.contents =
        dobInput.placeholder = "Entre com sua data de nascimento"
        return dobInput
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
    
    var viewModel: SignUpViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(email)
        let emailConstraints = [
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0 ),
            email.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
            email.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10.0),
            email.heightAnchor.constraint(equalToConstant: 50.0),
        ]
        
        view.addSubview(name)
        let nameConstraints = [
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
            name.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50.0),
            name.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        view.addSubview(password)
        let passwordConstraints = [
            password.leadingAnchor.constraint(equalTo: email.leadingAnchor),
            password.trailingAnchor.constraint(equalTo: email.trailingAnchor),
            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10.0),
            password.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        view.addSubview(document)
        let documentConstraints = [
            document.leadingAnchor.constraint(equalTo: password.leadingAnchor),
            document.trailingAnchor.constraint(equalTo: password.trailingAnchor),
            document.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10.0),
            document.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        view.addSubview(dob)
        let dobConstraints = [
            dob.leadingAnchor.constraint(equalTo: document.leadingAnchor),
            dob.trailingAnchor.constraint(equalTo: document.trailingAnchor),
            dob.topAnchor.constraint(equalTo: document.bottomAnchor, constant: 10.0),
            dob.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        view.addSubview(sendButton)
        let buttonConstraints = [
            sendButton.leadingAnchor.constraint(equalTo: dob.leadingAnchor),
            sendButton.trailingAnchor.constraint(equalTo: dob.trailingAnchor),
            sendButton.topAnchor.constraint(equalTo: dob.bottomAnchor, constant: 10.0),
            sendButton.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        NSLayoutConstraint.activate(nameConstraints)
        NSLayoutConstraint.activate(emailConstraints)
        NSLayoutConstraint.activate(passwordConstraints)
        NSLayoutConstraint.activate(documentConstraints)
        NSLayoutConstraint.activate(dobConstraints)
        NSLayoutConstraint.activate(buttonConstraints)
        
        
    }
    
    @objc func sendDidTap(_ sender: UIButton){
        viewModel?.send()
    }
}

extension SignUpViewController: SignUpViewModelDelegate {
    func viewModelDidChanged(state: SignUpState) {
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
        print("O estado da viewmodel é: \(state)")
    }
}
