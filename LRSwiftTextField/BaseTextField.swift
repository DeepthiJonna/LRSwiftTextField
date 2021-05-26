
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
