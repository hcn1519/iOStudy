//
//  ViewController.swift
//  LoginPage
//
//  Created by 홍창남 on 2017. 9. 8..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldCenterYConstraint: NSLayoutConstraint!

    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        pwdTextField.delegate = self
        idTextField.delegate = self
    }
    
    func isLandScape() -> Bool {
        return (UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight)
    }

}

// MARK: TextField 애니메이션, focus 이동
extension ViewController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if isLandScape() {
            switch textField {
            case idTextField:

                self.textFieldCenterYConstraint.constant = -40

                UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 5,
                               options: .curveEaseInOut, animations: {
                                self.view.layoutIfNeeded()
                }, completion: nil)
            default:
                break
            }
        }
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if isLandScape() {
            switch textField {
            case pwdTextField:

                self.textFieldCenterYConstraint.constant = 0
                textField.resignFirstResponder()

                UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 5,
                               options: .curveEaseInOut, animations: {
                                self.view.layoutIfNeeded()
                }, completion: nil)

            default:
                textField.resignFirstResponder()
                pwdTextField.becomeFirstResponder()
            }

        }
        return true
    }

}
