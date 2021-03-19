//
//  ConversionSave.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-16.
//

import UIKit
//MARK: ConversionSave Model
class ConversionSave: Codable {
    let name: String
    var unitSaveArray:[UnitSave]

    init(name: String, unitSaveArray:[UnitSave]) {
        self.name = name
        self.unitSaveArray = unitSaveArray
    }
    
    func getName() -> String {
        return name
    }
    
    func getUnitSaveArray() -> [UnitSave] {
        return unitSaveArray
    }
    
}
