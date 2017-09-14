//
//  ViewController.swift
//  LoginView
//
//  Created by 이미정 on 2017. 9. 8..
//  Copyright © 2017년 이미정. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var IDTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var containerStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IDTextField.delegate = self
        PasswordTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        IDTextField.resignFirstResponder()
        PasswordTextField.resignFirstResponder()
        return true
    }
    
    func keyboardwillShow(notification: Notification) {
        let keyboardFrame = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue
        if let keyboardHeight = keyboardFrame?.cgRectValue.height,
            containerStackView.frame.maxY > self.view.frame.height - keyboardHeight{
            let newBoundY = keyboardHeight - (self.view.frame.height - containerStackView.frame.maxY)
            self.view.bounds = CGRect(origin: CGPoint(x: self.view.bounds.origin.x, y: newBoundY) , size: self.view.bounds.size)
        }
    }
    
    func keyboardwillHide(notification: Notification) {
        self.view.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: self.view.bounds.size)
    }

    @IBAction func SignUpButtonAction(_ sender: Any) {
        print("touch up inside - sign up")
        self.view.endEditing(true)
    }
    
    @IBAction func SignInButtonAction(_ sender: Any) {
        if let id = IDTextField.text, let pw = PasswordTextField.text {
                    print("ID : \(id), PW : \(pw)")
        }
        self.view.endEditing(true)
    }
}

