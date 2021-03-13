//
//  WeightViewController.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-10.
//

import UIKit

class WeightViewController: UIViewController,CustomKeyboardDelegate {
    
    @IBOutlet weak var aboveKeyboardConstraint: NSLayoutConstraint!
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide)))

    }
    var activeTextField = UITextField()


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
        /// setting custom numeric keyboard
        setCustomNumericKeyboard()
    }
    func setCustomNumericKeyboard() {
        text.setAsNumericKeyboard(delegate: self)
        
        
        /// Obser which tracks the keyboard show event
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillHide() {
        view.endEditing(true)
        
        UIView.animate(withDuration: 0.25, animations: {
            self.aboveKeyboardConstraint.constant = 10.0
            self.view.layoutIfNeeded()
        })
    }
    
    func findFirstResponder(inView view: UIView) -> UIView? {
        for subView in view.subviews {
            if subView.isFirstResponder {
                return subView
            }
            
            if let recursiveSubView = self.findFirstResponder(inView: subView) {
                return recursiveSubView
            }
        }
        
        return nil
    }
    
    func numericKeyPressed(key: Int) {
        print("Numeric key \(key) pressed!")
    }
    func symbolPressed(symbol: String) {
        print("Symbol \(symbol) pressed!")
    }
    func donePressed() {
        print("Done pressed!")
    }
    
    func clearPressed() {
        print("Clear pressed!")
    }
    
       
    @objc func keyboardWillShow(notification: NSNotification) {
        let firstResponder = findFirstResponder(inView: view)
        
        if firstResponder != nil {
            activeTextField = firstResponder as! UITextField
            
            let activeTextFieldSuperView = activeTextField.superview!
            
            if let info = notification.userInfo {
                let keyboard: CGRect = info["UIKeyboardFrameEndUserInfoKey"] as! CGRect
                let targetY = view.frame.size.height - keyboard.height - 15 - activeTextField.frame.size.height
                let initialY = contentStackView.frame.origin.y + activeTextFieldSuperView.frame.origin.y + activeTextField.frame.origin.y
                
                if initialY > targetY {
                    let diff = targetY - initialY
                    let targetOffsetForTopConstraint = aboveKeyboardConstraint.constant + diff
                    view.layoutIfNeeded()
                    
                    UIView.animate(withDuration: 0.25, animations: {
                        self.aboveKeyboardConstraint.constant = targetOffsetForTopConstraint
                        self.view.layoutIfNeeded()
                    })
                }
                
                var contentInset: UIEdgeInsets = scrollView.contentInset
                contentInset.bottom = keyboard.size.height
                scrollView.contentInset = contentInset
            }
        }
    }
}
