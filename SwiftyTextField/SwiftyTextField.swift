//
//  SwiftyTextField.swift
//  SwiftyTextField
//
//  Created by Deepthi on 18/05/21.
//

import Foundation
import UIKit.UITextField


@IBDesignable open class SwiftyTextField : BaseTextField {

    open override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    @IBInspectable public var length:Int = 0
    @IBInspectable public var borderWidth:CGFloat = 0 {
        didSet {
            updateBorder()
        }
    }
    @IBInspectable public var borderColor: UIColor = .black{
        didSet {
            updateBorder()
        }
    }
    @IBInspectable public var activeBorderColor: UIColor = .black
    @IBInspectable public var activeTextColor: UIColor = .black
    @IBInspectable public var placeHolderColor: UIColor = .black {
        didSet {
            updatePlaceHolder()
        }
    }
    @IBInspectable public var placeHolderFont: UIFont = .systemFont(ofSize: 14) {
        didSet {
            updatePlaceHolder()
        }
    }

    private func updateBorder() {
        print(borderLayer)
        borderLayer.borderWidth = borderWidth
        borderLayer.borderColor = borderColor.cgColor
        borderLayer.frame = rectForBorder()
    }
    
    private func rectForBorder() -> CGRect {
        let newRect = CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)
            
            return newRect
    }
    func updatePlaceHolder() {
        if let placeholder = self.placeholder {
            let attributes = [NSAttributedString.Key.foregroundColor: placeHolderColor,NSAttributedString.Key.font: placeHolderFont ]
            self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        }
    }

    open override func becomeFirstResponder() -> Bool {

        borderLayer.borderColor = activeBorderColor.cgColor
        self.textColor = activeTextColor
        return super.becomeFirstResponder()
    }
    open override func resignFirstResponder() -> Bool {
        borderLayer.borderColor = borderColor.cgColor
        self.textColor = initialTextColor
        return super.resignFirstResponder()
    }
    open override func layoutSubviews() {
        super.layoutSubviews()
        borderLayer.frame = rectForBorder()
    }


}
