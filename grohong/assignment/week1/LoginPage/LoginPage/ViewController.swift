//
//  ViewController.swift
//  LoginPage
//
//  Created by Seong ho Hong on 2017. 9. 11..
//  Copyright © 2017년 Seong ho Hong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInButtonAction(_ sender: Any) {
        print("touch up insdie - sign in")
        print("ID: \(idTextField.text!), PW: \(pwdTextField.text!)")
    }
    


}

