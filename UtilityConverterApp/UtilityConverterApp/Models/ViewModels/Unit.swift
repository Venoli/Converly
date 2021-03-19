//
//  Unit.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-14.
//
import UIKit
//MARK: Unit View Model to represent conversion units and its data in the view
class Unit {
    let unit: Dimension
    var value: Double
    var textField : UITextField
    init(unit:Dimension) {
        self.unit = unit
        value = 0.0
        textField = UITextField()
    }
    
    func getUnit() -> Dimension {
        return unit
    }
    
    func getValue() -> Double {
        return value
    }
    
    func setValue(value: Double){
        self.value=value
        let roundedValue = DataTransfer.roundWithCurrentPrecision(value: value)
        
        
         if (unit == UnitMass.stones){
             
             //calculate pounds
             let reminder = value.truncatingRemainder(dividingBy: 1.0)
             let poundsOnlyinStones  = Measurement(value:reminder, unit:UnitMass.stones)
             let poundsOnlyinPounds = poundsOnlyinStones.converted(to:UnitMass.pounds)
             print("Reminder in pounds: \(poundsOnlyinPounds)")
            textField.text = "\(Int(value))st - \(DataTransfer.roundWithCurrentPrecision(value: poundsOnlyinStones.value))lb"

             

         }else{
            textField.text = String(roundedValue)
         }
    }
    
    
    func getUnitDisplayName() -> String{
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .long
        return formatter.string(from: self.unit).capitalized
    }
    
 
}
