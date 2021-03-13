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
            static let appBackgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9803921569, blue: 1, alpha: 1)
            static let shadowColor = #colorLiteral(red: 0.6862745098, green: 0.7882352941, blue: 0.8784313725, alpha: 1)
            static let animateShadowColor = #colorLiteral(red: 0.3176470588, green: 0.7294117647, blue: 0.9921568627, alpha: 1)
            static let buttonColor = UIColor.white
            static let animateButtonColor = #colorLiteral(red: 0.1882352941, green: 0.7215686275, blue: 0.7019607843, alpha: 1)
            static let buttonTextColor = #colorLiteral(red: 0.07058823529, green: 0.4745098039, blue: 0.6941176471, alpha: 1)
            static let animateButtonTextColor = UIColor.white

            
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

