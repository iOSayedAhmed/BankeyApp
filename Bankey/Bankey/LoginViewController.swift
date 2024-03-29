//
//  LoginViewController.swift
//  Bankey
//
//  Created by Develop on 28/06/2022.
//

import UIKit

protocol LoginViewControllerDelegate :AnyObject  {
    func didLogin()
}

class LoginViewController: UIViewController {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    weak var delegate : LoginViewControllerDelegate?
    
    var username:String? {
        return loginView.userNameTextField.text
    }
    
    var password:String?{
        return loginView.passwordTextField.text
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
        loginView.userNameTextField.text = ""
        loginView.passwordTextField.text = ""
    }
    
    
}
extension LoginViewController {
    private func style()  {
        //TitleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = "Bankey"
        
        //subtitleLabel
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.numberOfLines = 0
        subtitleLabel.text = "Your premium source for all things banking!"
        
        //loginView
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        //signInButton
        signInButton.translatesAutoresizingMaskIntoConstraints  = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .primaryActionTriggered)
        
        // errorLabel
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.text = "Error Message"
        errorMessageLabel.numberOfLines = .zero
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.isHidden = true
        
       
        
    }
    
    private func layout()  {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // Title
            NSLayoutConstraint.activate([
                subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            
            // Subtitle
            NSLayoutConstraint.activate([
                loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3),
                subtitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
                subtitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            ])
        
        
        //loginView
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // signInButton
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //errorMessageLabel
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            
            
        ])
        
  
    }
    
    
}

//MARK: Actions

extension LoginViewController {
    
    @objc func signInButtonTapped() {
        login()
    }
    
    private func login() {
        errorMessageLabel.isHidden = false
        guard let username = username , let password = password else {
            assertionFailure("username / password should never be nil")
            return
        }
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "username / password should never be blank")
            return
        }
        if username == "1" && password == "1"{
            errorMessageLabel.isHidden = true
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        }else {
            configureView(withMessage: "incorrect username / password !")
            return
        }
        
        
    }
    private func configureView(withMessage message:String){
        errorMessageLabel.text = message
    }
}
