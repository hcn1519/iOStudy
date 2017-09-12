//
//  PlayViewController.swift
//  TouchGame
//
//  Created by HannaJeon on 2017. 9. 11..
//  Copyright © 2017년 HannaJeon. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    var buttons = [UIButton]()
    var pressCount = 1
    var playing: Bool = false {
        didSet {
            switch playing {
            case true:
                startButton.isHidden = true
                historyButton.isEnabled = false
                historyButton.alpha = 0.6
            case false:
                startButton.isHidden = false
                historyButton.isEnabled = true
                historyButton.alpha = 1
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeButton.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        historyButton.addTarget(self, action: #selector(historyButtonAction), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startButtonAction(_:)), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        makeButtons()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (_) in
            self.setSizeButtons()
        })
        
    }
    
    func homeButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    func historyButtonAction() {
        if let historyViewController = storyboard?.instantiateViewController(withIdentifier: "HistoryViewController") as? HistoryViewController {
            present(historyViewController, animated: true, completion: nil)
        }
    }
    
    func startButtonAction(_ sender: UIButton) {
        playing = !playing
    }
    
}

extension PlayViewController {
    func makeButtons() {
        var randomNumbers = createRandomNumber()
        for _ in 1...25 {
            let button = UIButton()
            button.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
            button.layer.borderWidth = 4
            button.layer.borderColor = UIColor.white.cgColor
            button.titleLabel?.font = UIFont.systemFont(ofSize: 23)
            button.tag = randomNumbers.removeFirst()
            button.setTitle("\(button.tag)", for: .normal)
            button.addTarget(self, action: #selector(buttonAnimate(_:)), for: .touchDown)
            containerView.addSubview(button)
            buttons.append(button)
        }
        setSizeButtons()
    }
    
    func createRandomNumber() -> [Int] {
        var randomNumbers = [Int]()

        for i in 1...25 {
            randomNumbers.insert(i, at: Int(arc4random_uniform(UInt32(i))))
        }
        
        return randomNumbers
    }
    
    func setSizeButtons() {
        let buttonSize = Double(containerView.frame.width / sqrt(25))
        var buttonX = 0.0
        var buttonY = 0.0
        
        buttons.forEach { (button) in
            button.frame = CGRect(x: buttonX, y: buttonY, width: buttonSize, height: buttonSize)
            buttonX += buttonSize
            if buttonX >= Double(containerView.frame.width) {
                buttonX = 0.0
                buttonY += buttonSize
            }
        }
    }
    
    func buttonAnimate(_ sender: UIButton) {
        if sender.tag == pressCount {
            UIView.animate(withDuration: 0.6, animations: {
                sender.alpha = 0
            }) { (_) in
                sender.removeFromSuperview()
            }
            pressCount += 1
        } else {
            UIView.animate(withDuration: 0.05, animations: {
                sender.transform = CGAffineTransform(rotationAngle: 0.25)
            }, completion: { (_) in
                UIView.animate(withDuration: 0.05, animations: {
                    sender.transform = CGAffineTransform(rotationAngle: -0.25)
                }, completion: { (_) in
                    UIView.animate(withDuration: 0.05, animations: {
                        sender.transform = CGAffineTransform(rotationAngle: 0)
                    })
                })
            })
        }
    }

}












