//
//  Conversion.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-09.
//

import UIKit
//MARK: Conversion Model to populate conversion view
class Conversion {
    let name: String
    let icon: UIImage
    let segueID: String
    let cellColour: UIColor
    
    init(name: String, icon: UIImage, segueID: String, cellColour: UIColor) {
        self.name = name
        self.icon = icon
        self.segueID = segueID
        self.cellColour = cellColour
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

}
