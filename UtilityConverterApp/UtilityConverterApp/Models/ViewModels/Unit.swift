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
        textField.text = String(value)
    }
    
    func getUnitDisplayName() -> String{
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .long
        return formatter.string(from: self.unit).capitalized
    }
    
 
}
