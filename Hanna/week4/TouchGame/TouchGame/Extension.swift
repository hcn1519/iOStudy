//
//  Extension.swift
//  TouchGame
//
//  Created by HannaJeon on 2017. 9. 12..
//  Copyright © 2017년 HannaJeon. All rights reserved.
//

import UIKit

extension UIView {
    func successAnimate(duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: { 
            self.alpha = 0
        }) { (_) in
            self.isHidden = true
        }
    }
    
    func failAnimate(duration: TimeInterval, angle: CGFloat, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration, animations: { 
            self.transform = CGAffineTransform(rotationAngle: angle)
        }, completion: completion)
    }
}

extension Double {
    func convertTimeToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm:ss:SS"
        return dateFormatter.string(from: Date(timeIntervalSinceReferenceDate: self))
    }
}

extension UIAlertController {
    static func completeAlert() -> UIAlertController {
        let alertController = UIAlertController(title: "Clear!", message: "Enter your name", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Enter your name"
        })
        return alertController
    }
}

extension UIAlertAction {
    static func cancelButton(target: UIAlertController, handler: ((UIAlertAction) -> Void)? = nil) {
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: handler)
        target.addAction(cancelButton)
    }
    
    static func okButton(target: UIAlertController, handler: ((UIAlertAction) -> Void)? = nil) {
        let okButton = UIAlertAction(title: "OK", style: .default, handler: handler)
        target.addAction(okButton)
    }
}