//
//  DataTransfer.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-16.
//


import UIKit
//MARK: The helper class for implement helper methods of converting data types
class DataTransfer {
    
    //helper method used to transfer Conversion(View Model) to ConversionSave(Model)
   static func toConversionSaveModel(conversion:Conversion) -> ConversionSave{
        let unitSaves = toUnitSaveModel(units: conversion.getUnitsArray())
        let conversionSave = ConversionSave(name: conversion.getName(), unitSaveArray: unitSaves)

        return conversionSave
    }

    //helper method used to transfer Unit(View Model) to UnitSave(Model)
   static func toUnitSaveModel(units:[Unit]) -> [UnitSave]{
        var unitSaves = [UnitSave]()
        for unit in units {

            let unitSave = UnitSave(name: unit.getUnitDisplayName(), value: unit.getValue(), symbol: unit.getUnit().symbol)
            unitSaves.append(unitSave)
        }
        return unitSaves

    }
    
    
    //helper method use to retrive data from user defaults as ConversionSave Objects
    static func retrieveHistories(key:String) ->  [ConversionSave]{
      
        var conversionSaves = [ConversionSave]()
        if let storedObject: Data = UserDefaults.standard.data(forKey: key)
                {
                    do
                    {
                        conversionSaves = try PropertyListDecoder().decode([ConversionSave].self, from: storedObject)
                        for conversion in conversionSaves
                        {
                            print(conversion.getName())
                 
                        }
                    }
                    catch
                    {
                        print(error.localizedDescription)
                    }
                }
        return conversionSaves
        
    }

    static func roundWithCurrentPrecision(value: Double) -> Double{
        let precisionFact = Constants.Content.Numeric.CURRENT_PRECISION
        return Double(round(precisionFact*value)/precisionFact)
    }
    
    
}

