//
//  LoginViewController.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 9/4/25.
//


import UIKit

final class LoginViewController: UIViewController {
    private var userNameTextField: UITextField!
    private var passwordTextField: UITextField!
    private var loginButton: UIButton!
    private var forgotPasswordButton: UIButton!
    private var loginLabel: UILabel!
    private var loginLabelDescription: UILabel!
    private var emailLabel: UILabel!
    private var passwordLabel: UILabel!

    private let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
        
    }

    private func setupUI() {
        loginLabel = UILabel()
        loginLabel.text = "Login To Your Account"
        loginLabel.textAlignment = .left
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.textColor = .red
        loginLabel.numberOfLines = 0
        loginLabel.lineBreakMode = .byWordWrapping
        loginLabel.font = UIFont.boldSystemFont(ofSize: 33)
        view.addSubview(loginLabel)

        loginLabelDescription = UILabel()
        loginLabelDescription.text = "We are glad to see you again. Login to continue"
        loginLabelDescription.textAlignment = .left
        loginLabelDescription.translatesAutoresizingMaskIntoConstraints = false
        loginLabelDescription.textColor = .white
        loginLabelDescription.numberOfLines = 0
        loginLabelDescription.lineBreakMode = .byWordWrapping
        loginLabelDescription.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(loginLabelDescription)

        emailLabel = UILabel()
        emailLabel.text = "E-Mail"
        emailLabel.textAlignment = .left
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.textColor = .white
        emailLabel.numberOfLines = 0
        emailLabel.lineBreakMode = .byWordWrapping
        emailLabel.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(emailLabel)

        passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.textAlignment = .left
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.textColor = .white
        passwordLabel.numberOfLines = 0
        passwordLabel.lineBreakMode = .byWordWrapping
        passwordLabel.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(passwordLabel)

        userNameTextField = UITextField()
        userNameTextField.placeholder = "Enter Username"
        userNameTextField.textAlignment = .left
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userNameTextField)

        passwordTextField = UITextField()
        passwordTextField.placeholder = "Enter Password"
        passwordTextField.textAlignment = .left
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)

        loginButton = UIButton(type: .system)
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .systemRed
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(loginButton)

        forgotPasswordButton = UIButton(type: .system)
        forgotPasswordButton.setTitle("Forgot Password?", for: .normal)
        forgotPasswordButton.setTitleColor(UIColor.blue, for: .normal)
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(forgotPasswordButton)

        NSLayoutConstraint.activate([
            userNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            userNameTextField.widthAnchor.constraint(equalToConstant: 250),
            userNameTextField.heightAnchor.constraint(equalToConstant: 40),

            loginLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -300),
            loginLabel.widthAnchor.constraint(equalToConstant: 350),
            loginLabel.heightAnchor.constraint(equalToConstant: 80),

            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50),
            emailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            emailLabel.widthAnchor.constraint(equalToConstant: 350),
            emailLabel.heightAnchor.constraint(equalToConstant: 80),

            passwordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50),
            passwordLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            passwordLabel.widthAnchor.constraint(equalToConstant: 350),
            passwordLabel.heightAnchor.constraint(equalToConstant: 80),

            loginLabelDescription.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            loginLabelDescription.widthAnchor.constraint(equalToConstant: 250),
            loginLabelDescription.heightAnchor.constraint(equalToConstant: 40),

            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalTo: userNameTextField.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),

            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.widthAnchor.constraint(equalToConstant: 250),
            loginButton.heightAnchor.constraint(equalToConstant: 40),

            forgotPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 60),
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: -10),
            forgotPasswordButton.widthAnchor.constraint(equalToConstant: 250),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc private func buttonTapped() {
        let result = viewModel.login(userNameTextField.text, passwordTextField.text)
        if result {
            navigateToNextScreen()
        }
    }

    private func navigateToNextScreen() {
        let nextVC = NewsViewController()
        if let nav = navigationController {
            nav.pushViewController(nextVC, animated: true)
        } else {
            nextVC.modalPresentationStyle = .fullScreen
            present(nextVC, animated: true)
        }
    }
}

