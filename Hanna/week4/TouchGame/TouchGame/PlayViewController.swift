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
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var bestRecordLabel: UILabel!
    
    var buttons = [UIButton]()
    var pressCount = 1
    var timer: Timer?
    var time = Double() {
        didSet {
            timerLabel.text = time.convertTimeToString()
        }
    }
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateBestScore()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard buttons.isEmpty else { return }
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
        mixButtons()
        startTimer()
    }
    
}

extension PlayViewController {
    func makeButtons() {
        for _ in 1...25 {
            let button = UIButton()
            button.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
            button.layer.borderWidth = 4
            button.layer.borderColor = UIColor.white.cgColor
            button.titleLabel?.font = UIFont.systemFont(ofSize: 23)
            button.addTarget(self, action: #selector(pressButton(_:)), for: .touchDown)
            containerView.addSubview(button)
            buttons.append(button)
        }
        setSizeButtons()
    }
    
    func mixButtons() {
        var randomNumbers = [Int]()

        for i in 1...25 {
            randomNumbers.insert(i, at: Int(arc4random_uniform(UInt32(i))))
        }
        for button in buttons {
            button.isHidden = false
            button.alpha = 1
            button.tag = randomNumbers.removeFirst()
            button.setTitle("\(button.tag)", for: .normal)
        }
    }
    
    func setSizeButtons() {
        let buttonSize = Double(containerView.frame.width / sqrt(25))
        var buttonX = Double()
        var buttonY = Double()
        
        buttons.forEach { (button) in
            button.frame = CGRect(x: buttonX, y: buttonY, width: buttonSize, height: buttonSize)
            buttonX += buttonSize
            if buttonX >= Double(containerView.frame.width) {
                buttonX = Double()
                buttonY += buttonSize
            }
        }
    }
    
    func pressButton(_ sender: UIButton) {
        if sender.tag == pressCount {
            successAnimate(sender)
            if pressCount == 3 {
                completeGame()
                return
            }
            pressCount += 1
        } else {
            failAnimate(sender)
            penaltyTime()
        }
    }

}

extension PlayViewController {
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (timer) in
            self.time += timer.timeInterval
        })
    }
    
    func penaltyTime() {
        self.time += 1.5
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

extension PlayViewController {
    func successAnimate(_ sender: UIButton) {
        sender.successAnimate(duration: 0.5)
    }
    
    func failAnimate(_ sender: UIButton) {
        sender.failAnimate(duration: 0.05, angle: 0.25, completion: { (_) in
            sender.failAnimate(duration: 0.05, angle: -0.25, completion: { (_) in
                sender.failAnimate(duration: 0.05, angle: 0)
            })
        })
    }
    
    func completeGame() {
        playing = !playing
        pressCount = 1
        stopTimer()
        let alertController = UIAlertController.completeAlert()
        UIAlertAction.cancelButton(target: alertController, handler: { (_) in
            self.time = Double()
        })
        UIAlertAction.okButton(target: alertController, handler: { (_) in
            let name = alertController.textFields?[0].text
            let record = Record(name: name, scoreTime: self.time)
            Record.recordList.append(record)
            self.updateBestScore()
            self.time = Double()
        })
        present(alertController, animated: true, completion: nil)
    }
    
    func updateBestScore() {
        if let highScore = Record.recordList.first {
            bestRecordLabel.text = "\(highScore.name) \(highScore.scoreTime.convertTimeToString())"
        } else {
            bestRecordLabel.text = "- --:--:--"
        }
    }
}










