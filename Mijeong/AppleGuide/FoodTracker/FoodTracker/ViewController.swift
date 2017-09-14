//
//  ViewController.swift
//  FoodTracker
//
//  Created by 이미정 on 2017. 9. 14..
//  Copyright © 2017년 이미정. All rights reserved.
//

import UIKit

//View Controller는 ContentView에 대한 강한 참조를 가지고 있다.
class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    //weak: 약한 참조는 순환 참조 되는 것을 막아줌
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    //StoryBoard로 부터 ViewController가 로드되면 시스템은 View계층을 인스턴스화 하고 ViewController Outlet 할당
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
    }
    
    //Mark: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    //텍스트 필드에 입력 된 정보를 읽고 그 텍스트로 무언가를 할 수 있다.
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    //Mark: Actions
    //Target Action : 특정 이벤트가 발생할 때 다른 객체에게 메세지를 보내는 디자인 패턴
    @IBAction func setDefaultLabelText(_ sender: Any) {
        mealNameLabel.text = "Default Text"
    }
}

