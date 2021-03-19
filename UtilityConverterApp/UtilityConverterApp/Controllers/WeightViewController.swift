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
        //saveButtom.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
    }
 
    func setupUI() {
        viewHeading.text = WeightViewController.conversion.getName()
        viewHeading.textColor = WeightViewController.conversion.getCellColour()
        conversionIcon.image = WeightViewController.conversion.getIcon()
        if(WeightViewController.conversion.getName() == "Temperature"){
            Constants.Content.isNegativeKeyActive = true

        }else{
            Constants.Content.isNegativeKeyActive = false
        }
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

        print("jjjjjj")
        keyboardWillHide()
        //Set focused text field's unit value
        if let value = Double(activeTextField.text!){
            WeightViewController.conversion.getUnitsArray()[activeTextField.tag].setValue(value: value)
        }
      

        

        var previouseConversionSaves =  DataTransfer.retrieveHistories(key: WeightViewController.conversion.getName())

        let conversionSave = DataTransfer.toConversionSaveModel(conversion: WeightViewController.conversion)

        
        if previouseConversionSaves.count >= Constants.Content.Numeric.MAX_USER_DEFAULTS {
                previouseConversionSaves = Array(previouseConversionSaves.suffix(Constants.Content.Numeric.MAX_USER_DEFAULTS - 1))
            }
        previouseConversionSaves.append(conversionSave)
        do
        {
            UserDefaults.standard.set(try PropertyListEncoder().encode(previouseConversionSaves), forKey: WeightViewController.conversion.getName())
            
            let alert = UIAlertController(title: "Success", message: "The \(WeightViewController.conversion.getName()) conversion was successully saved!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
        }
        catch
        {
            print(error.localizedDescription)
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
               alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
               self.present(alert, animated: true, completion: nil)
        }

             
           

    }

}



