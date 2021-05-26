
//Copyright (c) 2021 DeepthiJonna
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

import Foundation
import UIKit.UITextField


@IBDesignable open class LRSwiftTextField : BaseTextField {

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
