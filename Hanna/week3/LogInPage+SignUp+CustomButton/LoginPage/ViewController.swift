//
//  ViewController.swift
//  LoginPage
//
//  Created by HannaJeon on 2017. 9. 7..
//  Copyright © 2017년 HannaJeon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let signInButton = CustomButton()
        let signUpButton = CustomButton()
        
        self.view.addSubview(signInButton)
        self.view.addSubview(signUpButton)
        
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(UIView().tintColor, for: .normal)
        signInButton.setTitleColor(.green, for: [.normal, .highlighted])
        signInButton.setTitleColor(.purple, for: [.selected, .highlighted])
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.red, for: .normal)
        signUpButton.setTitleColor(.green, for: [.normal, .highlighted])
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.leadingAnchor.constraint(equalTo: pwdTextField.leadingAnchor).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: signUpButton.leadingAnchor, constant: 8).isActive = true
        signInButton.topAnchor.constraint(equalTo: pwdTextField.bottomAnchor, constant: 8).isActive = true
        signInButton.widthAnchor.constraint(equalTo: signUpButton.widthAnchor).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.trailingAnchor.constraint(equalTo: pwdTextField.trailingAnchor).isActive = true
        signUpButton.topAnchor.constraint(equalTo: pwdTextField.bottomAnchor, constant: 8).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        signInButton.addTarget(self, action: #selector(self.signInButtonAction))
        signInButton.addTarget(self, action: #selector(self.isSelectedButton(_:)))
        
        signUpButton.addTarget(self, action: #selector(self.signUpButtonAction))
        
    }
    
    func signInButtonAction() {
        print("touched SignIn")
        print("ID: \(idTextField.text!), PWD: \(pwdTextField.text!)")
    }
    
    func signUpButtonAction() {
        print("touched SignUp")
        let signUpVC = storyboard?.instantiateViewController(withIdentifier: "SignUpView") as! SignUpViewController
        self.present(signUpVC, animated: true, completion: nil)
    }
    
    func isSelectedButton(_ sender: CustomButton) {
        sender.isSelected = !sender.isSelected
    }

}

