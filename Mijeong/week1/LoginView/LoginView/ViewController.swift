//
//  ViewController.swift
//  LoginView
//
//  Created by 이미정 on 2017. 9. 8..
//  Copyright © 2017년 이미정. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var IDTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SignUpButtonAction(_ sender: Any) {
        print("touch up inside - sign up")
    }
    @IBAction func SignInButtonAction(_ sender: Any) {
        if let id = IDTextField.text, let pw = PasswordTextField.text {
                    print("ID : \(id), PW : \(pw)")
        }
    }
}

