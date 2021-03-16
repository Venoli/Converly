//
//  CustomKeyboard.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-10.
//
import UIKit

@objc protocol CustomKeyboardDelegate {
    func numericKeyPressed(key: Int)
    func symbolPressed(symbol: String)
    func donePressed()
    func clearPressed()
}


class CustomKeyboard: UIView {
    
    @IBOutlet var buttonZero: UIButton!
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    @IBOutlet var buttonFour: UIButton!
    @IBOutlet var buttonFive: UIButton!
    @IBOutlet var buttonSix: UIButton!
    @IBOutlet var buttonSeven: UIButton!
    @IBOutlet var buttonEight: UIButton!
    @IBOutlet var buttonNine: UIButton!
    @IBOutlet var buttonDot: UIButton!
    @IBOutlet var buttonMinus: UIButton!
    @IBOutlet var buttonDone: UIButton!
    @IBOutlet var buttonClear: UIButton!
    @IBOutlet var controlKeyView: UIView!
    
    
    weak var delegate: CustomKeyboardDelegate?
    
    var allKeys: [UIButton] { return [buttonZero, buttonOne, buttonTwo, buttonThree, buttonFour, buttonFive, buttonSix, buttonSeven, buttonEight, buttonNine, buttonDot, buttonMinus] }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeKeyboard()
        NotificationCenter.default.addObserver(self, selector: #selector(activateMinusButton(notification:)), name: NSNotification.Name(rawValue: "activateMinusButton"), object: nil)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeKeyboard()
    }
    
    func initializeKeyboard() {
        let xibFileName = "CustomKeyboard"
        let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)![0] as! UIView
        initializeKeyboardStyles()
        addSubview(view)
        view.frame = bounds
    }
    private func initializeKeyboardStyles(){
        controlKeyView.backgroundColor = WeightViewController.conversion.cellColour
        for button in allKeys {
            button.layer.cornerRadius = 25
            button.layer.shadowColor = Constants.Design.Color.shadowColor.cgColor
            button.layer.shadowOpacity = 0.75
            button.layer.shadowOffset = .zero
            button.layer.shadowRadius = 6
            button.layer.shadowPath = UIBezierPath(roundedRect: buttonOne.layer.bounds, cornerRadius: 25).cgPath
            button.layer.shouldRasterize = true
            button.layer.rasterizationScale = UIScreen.main.scale
        }
    }
    
   
    @IBAction func numericButtonClick(_ sender: UIButton) {
        delegate?.numericKeyPressed(key: sender.tag)
        buttonClickAnimation(button: sender)
    }
    

    @IBAction func symbolicButtonClick(_ sender: UIButton) {
        if let symbol = sender.titleLabel?.text, symbol.count > 0 {
            delegate?.symbolPressed(symbol: symbol)
        }
        buttonClickAnimation(button: sender)
        }
    @IBAction func doneButtonClick(_ sender: UIButton) {
        delegate?.donePressed()

    }
    
    @IBAction func clearButtonClick(_ sender: UIButton) {
        delegate?.clearPressed()

    }
    
    @objc func activateMinusButton(notification: NSNotification) {
        buttonMinus.isUserInteractionEnabled = true
    }
    private func buttonClickAnimation(button:UIButton){
        button.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 1,
                                       delay: 0,
                                       usingSpringWithDamping: CGFloat(0.3),
                                       initialSpringVelocity: CGFloat(6.0),
                                       options: UIView.AnimationOptions.allowUserInteraction,
                                       animations: {
                                        button.transform = CGAffineTransform.identity
                                        self.animateButtonStyles(button: button)
                },
                                       completion: { Void in()
                                        self.resetButtonStyles(button: button)
                                       }
            )
        //                sender.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
        //                UIView.animate(withDuration: 0.3, animations: { () -> Void in
        //                    sender.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        //                })

    }
    private func animateButtonStyles(button:UIButton){
        button.setTitleColor(Constants.Design.Color.appWhite, for: .normal)
        button.backgroundColor = WeightViewController.conversion.cellColour
        button.layer.shadowColor = Constants.Design.Color.animateShadowColor.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 15
    }
    private func resetButtonStyles(button:UIButton){
        button.setTitleColor(Constants.Design.Color.buttonTextColor, for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.shadowColor = Constants.Design.Color.shadowColor.cgColor
        button.layer.shadowOpacity = 0.75
        button.layer.shadowRadius = 6

    }
    
}
