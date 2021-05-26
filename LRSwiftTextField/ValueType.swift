
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

public enum ValueType: Int {
    case onlyLetters = 1
    case onlyNumbers
    case phoneNumber   // Allowed "+0123456789"
    case alphaNumeric
    case fullName       // Allowed letters and space
    
    var type: CharacterSet {
        var characterSet : CharacterSet
            switch self {
            case .onlyLetters:
                characterSet = CharacterSet.letters
            case .onlyNumbers:
                characterSet = CharacterSet.decimalDigits

            case .phoneNumber:
                characterSet = CharacterSet(charactersIn: "+0123456789")

            case .alphaNumeric:
                characterSet = CharacterSet.alphanumerics

            case .fullName:
                characterSet = CharacterSet.letters
                characterSet = characterSet.union(CharacterSet(charactersIn: " "))
            }
        return characterSet.inverted
    }
    static func getType(rawValue: Int) -> CharacterSet?  {
        if let fontType = ValueType(rawValue: rawValue) {
            return fontType.type
        }
        return nil
    }

}
