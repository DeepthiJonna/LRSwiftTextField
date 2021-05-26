//
//  BaseTextField.swift
//  SwiftyTextField
//
//  Created by Deepthi on 25/05/21.
//

import Foundation
import UIKit.UITextField

open class BaseTextField : UITextField {
    
    let borderLayer : CALayer = CALayer()
    var initialTextColor : UIColor = .black
    
    @IBInspectable public var inputType: Int = 0

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override open func prepareForInterfaceBuilder() {
        draw(frame)
    }
    open override func draw(_ rect: CGRect) {
        borderLayer.masksToBounds = true
        layer.addSublayer(borderLayer)
        initialTextColor = self.textColor ?? .black
    }
    
    override public func deleteBackward() {
        if text == "" {
            if let delegate = delegate,  delegate.responds(to: #selector(UITextFieldDelegate.textField(_:shouldChangeCharactersIn:replacementString:))) {
              _ =  delegate.textField!(self, shouldChangeCharactersIn: NSMakeRange(0, 0), replacementString: "")
            }
        }
        super.deleteBackward()
    }
    
    func verifyFields(range: NSRange, replacementString string: String) -> Bool {
        if let valueType = ValueType.getType(rawValue: inputType)  {
            if string.rangeOfCharacter(from: valueType) != nil {
                return false
            }
        }
        return true
    }
    
}
