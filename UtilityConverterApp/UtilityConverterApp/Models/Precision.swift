//
//  Precision.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-17.
//

import UIKit
//MARK: Precision Model to populate precisions for settings
class Precision {
    let name: String
    var value: Double
    init(name: String, value: Double) {
        self.name = name
        self.value = value
    }
    
    func getName() -> String {
        return name
    }
    
    func getValue() -> Double {
        return value
    }

}
