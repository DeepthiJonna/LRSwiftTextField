//
//  ValueType.swift
//  SwiftyTextField
//
//  Created by Deepthi on 25/05/21.
//

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
