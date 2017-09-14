//
//  ViewController.swift
//  LogIn
//
//  Created by Danb on 2017. 9. 14..
//  Copyright © 2017년 Danb. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextField.delegate = self
        passwordTextField.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //키보드숨기기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func touchedSignIn(_ sender: Any) {
        if let idText = idTextField.text {
            if let pwText = passwordTextField.text {
                print("Id:\(idText), pw:\(pwText)")
            }
        }
        
        //옵셔널 바로 푸는 방법 (위험한 방법)
        //print("Id:\(idTextField.text!), pw:\(passwordTextField.text!)")
    }
    
    @IBAction func touchedSignUp(_ sender: Any) {
        print("touched up inside - sign up")
    }


}

