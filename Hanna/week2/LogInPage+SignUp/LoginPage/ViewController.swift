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
        
    }

    @IBAction func signInButtonAction(_ sender: UIButton) {
        print("touched SignIn")
        print("ID: \(idTextField.text!), PWD: \(pwdTextField.text!)")
    }
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        print("touched SignUp")
        let signUpViewController = storyboard?.instantiateViewController(withIdentifier: "SignUpView") as! SignUpViewController
        present(signUpViewController, animated: true, completion: nil)
    }

}

