//
//  DataTransfer.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-16.
//


import UIKit
//MARK: The helper class use to transfer View Models to Models
class DataTransfer {
    
//   static func toConversionSaveModel(conversion:Conversion) -> ConversionSave{
//        let unitSaves = toUnitSaveModel(units: conversion.getUnitsArray())
//        let conversionSave = ConversionSave(name: conversion.getName(), unitSaveArray: unitSaves)
//
//        return conversionSave
//    }

   static func toUnitSaveModel(units:[Unit]) -> [UnitSave]{
        var unitSaves = [UnitSave]()
        for unit in units {

            let value = String(unit.getValue()) + unit.getUnit().symbol
            let unitSave = UnitSave(name: unit.getUnitDisplayName(), value: value)
            unitSaves.append(unitSave)
        }
        return unitSaves

    }
}

