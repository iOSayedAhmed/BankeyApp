//
//  LoginView.swift
//  Bankey
//
//  Created by Develop on 28/06/2022.
//


import Foundation
import UIKit

class LoginView: UIView {
    
  
    let stackView = UIStackView()
    let userNameTextField = UITextField()
    let dividerView = UIView()
    let passwordTextField = UITextField()
 
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension LoginView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
     
        
        //Stack View
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        //UserName TextField
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.placeholder = String("UserName")
        userNameTextField.delegate = self
       
        //UserName TextField
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = String("Password")
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        
        //dividerView
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    func layout() {
     
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)
        addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        //Divider
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
    }
}
//MARK: - UITextFieldDelegate
extension LoginView : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.endEditing(true)
        passwordTextField.endEditing(true)

        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
