//
//  UITextField+CustomKeyboard.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-11.
//


import UIKit

private var numericKeyboardDelegate: CustomKeyboardDelegate?

extension UITextField: CustomKeyboardDelegate {
   
    func setAsNumericKeyboard(delegate: CustomKeyboardDelegate?) {
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        let width = bounds.size.width
        let numericKeyboard = CustomKeyboard(frame: CGRect(x: 0, y: 0, width: width, height: height/2.2))
        self.inputView = numericKeyboard
        numericKeyboardDelegate = delegate
        numericKeyboard.delegate = self
    }
    
    func unsetAsNumericKeyboard() {
        if let numericKeyboard = self.inputView as? CustomKeyboard {
            numericKeyboard.delegate = nil
        }
        self.inputView = nil
        numericKeyboardDelegate = nil
    }
    
    internal func numericKeyPressed(key: Int) {
        self.insertText(String(key))
        numericKeyboardDelegate?.numericKeyPressed(key: key)
    }
    

    internal func symbolPressed(symbol: String) {
        self.insertText(String(symbol))
        numericKeyboardDelegate?.symbolPressed(symbol: symbol)
    }
    internal func donePressed() {
        numericKeyboardDelegate?.donePressed()
    }
    internal func clearPressed() {
            self.deleteBackward()
            numericKeyboardDelegate?.clearPressed()
        }
    


    
    
}
