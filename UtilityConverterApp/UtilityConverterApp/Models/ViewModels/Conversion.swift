//
//  Conversion.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-09.
//

import UIKit
//MARK: Conversion View Model to populate conversion view
class Conversion {
    let name: String
    let icon: UIImage
    let segueID: String
    let cellColour: UIColor
    var unitsArray:[Unit]

    init(name: String, icon: UIImage, segueID: String, cellColour: UIColor, dimensionArray:[Dimension]) {
        self.name = name
        self.icon = icon
        self.segueID = segueID
        self.cellColour = cellColour
        self.unitsArray = [Unit]()

        for dimension in dimensionArray {
            let unit = Unit(unit: dimension)
            unitsArray.append(unit)
        }
    }
    init() {
        self.name = "name"
        self.icon = UIImage(named: "baseline_settings_black_24pt")!
        self.segueID = "goToWeightConversions"
        self.cellColour = UIColor(red: 39 / 255, green: 180 / 255, blue: 175 / 255, alpha: 1.00)
        self.unitsArray = [Unit]()
    }
    func getName() -> String {
        return name
    }
    
    func getIcon() -> UIImage {
        return icon
    }

    func getSegueID() -> String {
        return segueID
    }

    func getCellColour() -> UIColor {
        return cellColour
    }
    func getUnitsArray() -> [Unit] {
        return unitsArray
    }

}
