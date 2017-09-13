//
//  CustomButton.swift
//  CustomButton
//
//  Created by HannaJeon on 2017. 9. 8..
//  Copyright © 2017년 HannaJeon. All rights reserved.
//

import UIKit

class CustomButton: UIView {
    
    let label = UILabel()
    var option = Option()
    var targetActions = [Action]()
    
    var isEnable: Bool {
        get {
            return !state.contains(.disabled)
        }
        set {
            switch newValue {
            case true:
                state.remove(.disabled)
            case false:
                state.update(with: .disabled)
            }
        }
    }
    
    var isSelected: Bool {
        get {
            return !state.contains(.selected)
        }
        set {
            switch newValue {
            case true:
                state.update(with: .normal)
                state.remove(.selected)
            case false:
                state.update(with: .selected)
                state.remove(.normal)
            }
        }
    }
    
    var state: ControlState = .normal {
        didSet {
            drawButton()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(label)
        label.frame = self.bounds
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        label.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setTitle(_ title: String?, for state: ControlState) {
        var option = self.option.stateOption(for: state) ?? Option()
        option.title = title
        self.option.setStateOption(option, for: state, button: self)
    }
    
    func setTitleColor(_ color: UIColor?, for state: ControlState) {
        var option = self.option.stateOption(for: state) ?? Option()
        option.titleColor = color
        self.option.setStateOption(option, for: state, button: self)
    }
    
    func setTitleFont(_ font: UIFont, for state: ControlState) {
        var option = self.option.stateOption(for: state) ?? Option()
        option.font = font
        self.option.setStateOption(option, for: state, button: self)
    }
    
    func drawButton() {
        self.alpha = self.state.contains(.highlighted) || self.state.contains(.disabled) ? 0.6 : 1
        self.isUserInteractionEnabled = !state.contains(.disabled)
        if state.contains(.disabled) {
            return
        }
        
        let option = self.option.stateOption(for: state)
        let normalOption = self.option.stateOption(for: .normal)

        self.label.text = option?.title ?? normalOption?.title
        self.label.textColor = option?.titleColor ?? normalOption?.titleColor
        self.label.font = option?.font ?? normalOption?.font
    }
    
    func addTarget(_ target: NSObject, action: Selector) {
        let action = Action(target: target, selector: action)
        self.targetActions.append(action)
    }
    
}

extension CustomButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.state.update(with: .highlighted)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.state.remove(.highlighted)
        targetActions.forEach { $0.target.perform($0.selector, with: self, afterDelay: 0) }
    }
}

struct ControlState: OptionSet, Hashable {
    var hashValue: Int {
        return self.rawValue
    }
    let rawValue: Int
    
    static var normal = ControlState(rawValue: 1 << 0)
    static var selected = ControlState(rawValue: 1 << 1)
    static var highlighted = ControlState(rawValue: 1 << 2)
    static var disabled = ControlState(rawValue: 1 << 3)
}

struct Option {
    var title: String?
    var titleColor: UIColor?
    var font: UIFont?
    
    var infoDic = [ControlState:Any]()
    
    func stateOption(for state: ControlState) -> Option? {
        return infoDic[state] as? Option
    }
    
    mutating func setStateOption(_ info: Option, for state: ControlState, button: CustomButton) {
        infoDic[state] = info
        button.drawButton()
    }
}

struct Action {
    var target: NSObject
    var selector: Selector
}
