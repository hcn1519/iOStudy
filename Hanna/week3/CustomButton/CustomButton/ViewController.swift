//
//  ViewController.swift
//  CustomButton
//
//  Created by HannaJeon on 2017. 9. 8..
//  Copyright © 2017년 HannaJeon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let button = CustomButton(frame: CGRect(x: 100, y: 200, width: 100, height: 50))
    let disableButton = CustomButton(frame: CGRect(x: 50, y: 120, width: 200, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.backgroundColor = UIColor.black
        
        button.setTitle("normal", for: .normal)
        button.setTitleColor(.yellow, for: .normal)
        
        button.setTitle("highlighted1", for: [.normal, .highlighted])
        button.setTitleColor(.white, for: [.normal, .highlighted])
        
        button.setTitle("selected", for: .selected)
        button.setTitleColor(.green, for: .selected)
        
        button.setTitle("highlighted2", for: [.selected, .highlighted])
        button.setTitleColor(.red, for: [.selected, .highlighted])
        
        self.view.addSubview(button)
        
        disableButton.setTitle("Disable the Button", for: .normal)
        disableButton.setTitle("Enable the Button", for: .selected)
        disableButton.setTitleColor(.black, for: .normal)
        disableButton.addTarget(self, action: #selector(self.disableButtonAction))
        
        self.view.addSubview(disableButton)
    }
    
    func disableButtonAction() {
        button.isEnable = !button.isEnable
    }
}

