//
//  SignUpViewController.swift
//  LoginPage
//
//  Created by HannaJeon on 2017. 9. 8..
//  Copyright © 2017년 HannaJeon. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var checkPwdTextField: UITextField!
    @IBOutlet weak var introduceTextView: UITextView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        profileImageView.isUserInteractionEnabled = true
        idTextField.delegate = self
        pwdTextField.delegate = self
        checkPwdTextField.delegate = self
    }
    
    @IBAction func cancelButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        guard let pwd = pwdTextField.text, let checkPwd = checkPwdTextField.text else { return }
        
        if pwd == checkPwd {
            self.dismiss(animated: true, completion: nil)
        } else {
            print("비밀번호를 확인해주세요")
        }
        
    }
    
    @IBAction func profileImagePicker(_ sender: UITapGestureRecognizer) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func tapViewAction(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            profileImageView.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    

}
