//
//  UnitSave.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-16.
//

import UIKit
//MARK: Conversion Model 
class UnitSave: Codable {
    let name: String
    let value: Double
    let symbol: String
    
    init(name: String, value: Double, symbol: String) {
        self.name = name
        self.value = value
        self.symbol = symbol
    }
    
    func getName() -> String {
        return name
    }
    
    func getValue() -> Double {
        return value
    }

    func getSymbol() -> String {
        return symbol
    }
}
