//
//  UnitInput.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-13.
//
import UIKit

class UnitInput: UICollectionViewCell {

    
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var unitName: UILabel!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var stackView: UIStackView!
    

    override func awakeFromNib() {
    super.awakeFromNib()

}
    func setData(unit: Unit){
        //set data
        self.unitName.text = unit.getUnitDisplayName()
       
        if (unit.getUnit() == UnitMass.stones){
            
            //calculate pounds
            let reminder = unit.getValue().truncatingRemainder(dividingBy: 1.0)
            print("Reminder: \(reminder)")
            let poundsOnlyinStones  = Measurement(value:reminder, unit:UnitMass.stones)
            let poundsOnlyinPounds = poundsOnlyinStones.converted(to:UnitMass.pounds)
            print("Reminder in pounds: \(poundsOnlyinPounds)")
            print("Output: \(Int(unit.getValue()) )st - \(Int(poundsOnlyinPounds.value.rounded()))lb")
            amount.text = ("\(Int(unit.getValue()) )st - \(DataTransfer.roundWithCurrentPrecision(value: poundsOnlyinStones.value))lb")

            

        }else{
            amount.text = String(DataTransfer.roundWithCurrentPrecision(value: unit.getValue()) )

            let label = UILabel()
            label.text = unit.getUnit().symbol
            amount.rightViewMode = .always
            amount.rightView = label
            
            //label style
            label.textAlignment = NSTextAlignment.center
            label.attributedText = NSAttributedString(string: unit.getUnit().symbol, attributes: Constants.Design.Font.appFontAttribute)
            label.textColor = Constants.Design.Color.appFontColor
            
        }
        
       
    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
        Constants.Content.isSaveEnabled = true
                    if let value = Double(sender.text!){
                        UnitsCollectionView.calculateMeasures(value: value,tag: sender.tag)
            
            }
            
        

    }
    

    @IBAction func editingDidEnd(_ sender: UITextField) {
        if let value = Double(sender.text!){
        UnitsCollectionView.saveMeasure(value: value,tag: sender.tag)
        }
        
    }
    
    private func addPoundView(value:Double){
        let textField = UITextField()
        //calculation
        
        textField.text = String(value)


        //Styles
        let label = UILabel()
        amount.rightViewMode = .always
        amount.rightView = label 
        
        //style
        label.textAlignment = NSTextAlignment.center
        label.attributedText = NSAttributedString(string: "lb", attributes: Constants.Design.Font.appFontAttribute)
        label.textColor = Constants.Design.Color.appFontColor
        self.addSubview(textField)
        
    }
    
}
