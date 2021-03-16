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
    

    override func awakeFromNib() {
    super.awakeFromNib()

}
    func setData(unit: Unit){
        self.unitName.text = unit.getUnitDisplayName()
        amount.text = String(unit.getValue())
        
    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
                    if let value = Double(sender.text!){
                        UnitsCollectionView.calculateMeasures(value: value,tag: sender.tag)
            
            }
            
        

    }
    
    @IBAction func editingDidEnd(_ sender: UITextField) {
        if let value = Double(sender.text!){
        UnitsCollectionView.saveMeasure(value: value,tag: sender.tag)
        }
        
    }
    

}
