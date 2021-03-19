//
//  HistoryCard.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-17.
//
import UIKit

class HistoryCard: UICollectionViewCell {


    @IBOutlet weak var historyDescription: UILabel!
    //@IBOutlet weak var conversionIcon: UIImageView!
    override func awakeFromNib() {
    super.awakeFromNib()

}
    func setData(image: UIImage, conversionData: [UnitSave]){
       // conversionIcon.image = image
        historyDescription.text = formatText(conversionData: conversionData)
        
    }
    
    func formatText(conversionData: [UnitSave]) -> String{
        var description = ""
        
       
        for unit in conversionData {
            let unitName =   "\(unit.getName()): "
            description += unitName.padding(toLength: 15, withPad: " ", startingAt: 0)
            
            if(unit.getName() == "Stones"){
                //calculate pounds
                let reminder = unit.value.truncatingRemainder(dividingBy: 1.0)
                let poundsOnlyinStones  = Measurement(value:reminder, unit:UnitMass.stones)
                let poundsOnlyinPounds = poundsOnlyinStones.converted(to:UnitMass.pounds)
                print("Reminder in pounds: \(poundsOnlyinPounds)")
                description += "\(Int(unit.value))st - \(DataTransfer.roundWithCurrentPrecision(value: poundsOnlyinStones.value))lb"

            }
            
            else{
            description += String(DataTransfer.roundWithCurrentPrecision(value: unit.getValue()))
            description += " " + unit.getSymbol()
            description += "\n"
            }
        }
        return description
        
    }
    
    
    
}
