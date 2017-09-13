//
//  SignUpViewController.swift
//  LoginPage
//
//  Created by HannaJeon on 2017. 9. 8..
//  Copyright © 2017년 HannaJeon. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var checkPwdTextField: UITextField!
    @IBOutlet weak var introduceTextView: UITextView!

    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let viewTap = UITapGestureRecognizer(target: self, action: #selector(tapViewAction))
        viewTap.delegate = self
        self.view.addGestureRecognizer(viewTap)
        
        let imageViewTap =  UITapGestureRecognizer(target: self, action: #selector(profileImagePicker))
        imageViewTap.delegate = self
        profileImageView.addGestureRecognizer(imageViewTap)
        
        let cancelButton = CustomButton()
        let signUpButton = CustomButton()
        
        self.view.addSubview(cancelButton)
        self.view.addSubview(signUpButton)
        
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.red, for: .normal)
        cancelButton.setTitleColor(.brown, for: [.normal, .highlighted])
        cancelButton.setTitleFont(.systemFont(ofSize: 15), for: .normal)
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(UIView().tintColor, for: .normal)
        signUpButton.setTitleColor(.purple, for: [.normal, .highlighted])
        signUpButton.setTitleFont(.systemFont(ofSize: 15), for: .normal)
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.trailingAnchor.constraint(equalTo: signUpButton.leadingAnchor, constant: 8).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: introduceTextView.leadingAnchor).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: signUpButton.bottomAnchor).isActive = true
        cancelButton.topAnchor.constraint(equalTo: signUpButton.topAnchor).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: signUpButton.widthAnchor).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.trailingAnchor.constraint(equalTo: introduceTextView.trailingAnchor).isActive = true
        signUpButton.topAnchor.constraint(equalTo: introduceTextView.bottomAnchor, constant: 8).isActive = true
        
        cancelButton.addTarget(self, action: #selector(self.cancelButtonAction))
        signUpButton.addTarget(self, action: #selector(self.signUpButtonAction))
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        profileImageView.isUserInteractionEnabled = true
        idTextField.delegate = self
        pwdTextField.delegate = self
        checkPwdTextField.delegate = self
    }
    
    func cancelButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func signUpButtonAction() {
        guard let pwd = pwdTextField.text, let checkPwd = checkPwdTextField.text else { return }
        
        if pwd == checkPwd {
            self.dismiss(animated: true, completion: nil)
        } else {
            print("비밀번호를 확인해주세요")
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view is CustomButton {
            return false
        }
        return true
    }
    
    func profileImagePicker() {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func tapViewAction() {
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
