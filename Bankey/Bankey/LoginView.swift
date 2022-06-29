//
//  LoginView.swift
//  Bankey
//
//  Created by Develop on 28/06/2022.
//


import Foundation
import UIKit

class LoginView: UIView {
    
    let userNameTextField = UITextField()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // needed when using Storyboard
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension LoginView {
    func style() {
        
        translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.placeholder = String("UserName")
        userNameTextField.backgroundColor = .blue
        userNameTextField.delegate = self
    }
    
    func layout() {
        addSubview(userNameTextField)
        NSLayoutConstraint.activate([
            userNameTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            userNameTextField.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: userNameTextField.trailingAnchor, multiplier: 1)
        ])
    }
}
//MARK: - UITextFieldDelegate
extension LoginView : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else
        {
            
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
