//
//  UnitSave.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-16.
//

import UIKit
//MARK: Conversion Model 
class UnitSave: Encodable {
    let name: String
    var value: String
    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
    
    func getName() -> String {
        return name
    }
    
    func getValue() -> String {
        return value
    }

}
