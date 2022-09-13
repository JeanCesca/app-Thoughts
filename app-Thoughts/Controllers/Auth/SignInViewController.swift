//
//  SignInViewController.swift
//  app-Thoughts
//
//  Created by Jean Ricardo Cesca on 12/09/22.
//

import UIKit

class SignInViewController: UIViewController {
    
    let headerView = SignInHeaderView()
    
    private let emailField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        textField.leftViewMode = .always
        textField.placeholder = "e-mail address"
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        return textField
    }()
    
    private let passwordField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.placeholder = "password"
        textField.isSecureTextEntry = true
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        return textField
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Sign In", for: .normal)
        button.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.link, for: .normal)
        button.setTitle("Create Account", for: .normal)
        button.addTarget(self, action: #selector(didCreateAccount), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sign In"
        view.backgroundColor = .systemBackground

        setUpNavigation()
        configureConstraints()
        
//        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
//            if IAPManager.shared.isPremium() {
//                let nav = UINavigationController(rootViewController: PayWallViewController())
//                self.present(nav, animated: true, completion: nil)
//            }
//        }
    }
    
    private func setUpNavigation() {
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func didTapSignIn() {
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty
        else { return }
        
        AuthManager.shared.signIn(email: email, password: password) { [weak self] success in
            if success {
                DispatchQueue.main.async {
                    
                    UserDefaults.standard.set(email, forKey: "email")
                    
                    let vc = MainTabViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true, completion: nil)
                }
            } else {
                self?.showAlertSignError()
            }
        }
    }
    
    private func showAlertSignError() {
        let alertSheet = UIAlertController(title: "Sign Out", message: "Are you sure you'd like to sign out?", preferredStyle: .actionSheet)
        present(alertSheet, animated: true, completion: nil)
        
        alertSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertSheet.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { _ in
            
        }))
    }
    
    @objc private func didCreateAccount() {
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    private func configureConstraints() {
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(headerView)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(signInButton)
        view.addSubview(createAccountButton)
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 200),
            
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 40),
            emailField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordField.leadingAnchor.constraint(equalTo: emailField.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: emailField.trailingAnchor),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 8),
            passwordField.heightAnchor.constraint(equalToConstant: 40),
            
            signInButton.leadingAnchor.constraint(equalTo: emailField.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: emailField.trailingAnchor),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 32),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            
            createAccountButton.leadingAnchor.constraint(equalTo: emailField.leadingAnchor),
            createAccountButton.trailingAnchor.constraint(equalTo: emailField.trailingAnchor),
            createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccountButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 8),
            createAccountButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
    

}
