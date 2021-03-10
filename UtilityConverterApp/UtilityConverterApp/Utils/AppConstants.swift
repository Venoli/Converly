//
//  AppConstants.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-09.
//
import Foundation
import UIKit

struct Constants{
    struct Design{
        struct Color{
            static let appBackgroundColor = #colorLiteral(red: 0.986394465, green: 1, blue: 0.9821222425, alpha: 1)

            
        }
        struct Font{
            
            
        }

        
    }
    struct Content{
        
        static func getConversionCardDescription(unit: String)->String{
        return "Unit conversions among \(unit) units"
        }
    }

    
}

