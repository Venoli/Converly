//
//  WeightViewController.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-10.
//

import UIKit

class WeightViewController: UIViewController,CustomKeyboardDelegate {
    
    @IBOutlet weak var aboveKeyboardConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewHeading: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var conversionIcon: UIImageView!
    @IBOutlet weak var saveButtom: UIBarButtonItem!
    var activeTextField = UITextField()
    static var conversion = Conversion()


    override func viewDidLoad() {
  view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide)))
    setupUI()
       // self.view.backgroundColor = Constants.Design.Color.appWhite
        //saveButtom.isEnabled = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
    }
 
    func setupUI() {
        viewHeading.text = WeightViewController.conversion.getName()
        viewHeading.textColor = WeightViewController.conversion.getCellColour()
        conversionIcon.image = WeightViewController.conversion.getIcon()
    }
    
    func setCustomNumericKeyboard(textField:UITextField) {
        textField.setAsNumericKeyboard(delegate: self)
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
        keyboardWillHide()
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
                var diff:CGFloat = 0
                if initialY > targetY {
                    diff = targetY - initialY
                    let targetOffsetForTopConstraint = aboveKeyboardConstraint.constant + diff
                    view.layoutIfNeeded()
                    
                    UIView.animate(withDuration: 0.25, animations: {
                        self.aboveKeyboardConstraint.constant = targetOffsetForTopConstraint
                        self.view.layoutIfNeeded()
                    })
                }
                
//                let childVC = children[0] as! UnitsCollectionView
                aboveKeyboardConstraint.constant = keyboard.size.height - aboveKeyboardConstraint.constant - diff
//                contentInset.bottom = keyboard.size.height
//                scrollView.contentInset = contentInset
            }
        }
    }
    
    @IBAction func saveConversion(_ sender: UIBarButtonItem) {
        let unitSaves = DataTransfer.toUnitSaveModel(units: WeightViewController.conversion.getUnitsArray())
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        if let encodedConversion = try? encoder.encode(unitSaves){
            defaults.set(encodedConversion, forKey: WeightViewController.conversion.getName())

        }
        

    }
    
}



