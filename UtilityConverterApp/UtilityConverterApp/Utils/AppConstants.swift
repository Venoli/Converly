//
//  AppConstants.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-09.
//
// MARK: Can be added to seperate files for better readability

import Foundation
import UIKit

struct Constants{
    struct Design{
        struct Color{
            static let appWhite = #colorLiteral(red: 0.9568627451, green: 0.9803921569, blue: 1, alpha: 1)
            static let shadowColor = #colorLiteral(red: 0.6862745098, green: 0.7882352941, blue: 0.8784313725, alpha: 1)
            static let animateShadowColor = #colorLiteral(red: 0.3176470588, green: 0.7294117647, blue: 0.9921568627, alpha: 1)
            static let animateButtonColor = #colorLiteral(red: 0.1882352941, green: 0.7215686275, blue: 0.7019607843, alpha: 1)
            static let buttonTextColor = #colorLiteral(red: 0.07058823529, green: 0.4745098039, blue: 0.6941176471, alpha: 1)
            static let appColor = #colorLiteral(red: 0.7058823529, green: 0.1411764706, blue: 0.3843137255, alpha: 1)
            static let appColorLight = #colorLiteral(red: 0.8784313725, green: 0.7568627451, blue: 0.8156862745, alpha: 1)
            static let appFontColor =  #colorLiteral(red: 0.1058823529, green: 0.3137254902, blue: 0.4980392157, alpha: 1)

        }
        struct Font{
            
            static let appFontAttribute = [ NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 16)! ]

        }

        
    }
    struct Content{
        static var conversions = [Conversion]()
        static var precisions = [Precision]()
        static var isNegativeKeyActive = false
        static var isSaveEnabled = false
        static func getConversionCardDescription(unit: String)->String{
        return "Unit conversions among \(unit) units"
        }
        
        
        static func initConversions(){
            
            let weightUnits:[Dimension] = [UnitMass.kilograms, UnitMass.grams, UnitMass.ounces, UnitMass.pounds, UnitMass.stones]
            let weight = Conversion(name: "Weight", icon: UIImage(named: "Weight")!, segueID: "goToWeightConversions", cellColour: UIColor(red: 39 / 255, green: 180 / 255, blue: 175 / 255, alpha: 1.00),dimensionArray: weightUnits)
            
            let temperatureUnits:[Dimension] = [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin]
            let temperature = Conversion(name: "Temperature", icon: UIImage(named: "Temperature")!, segueID: "goToWeightConversions", cellColour: UIColor(red: 239 / 255, green: 119 / 255, blue: 109 / 255, alpha: 1.00),dimensionArray: temperatureUnits)

            let lengthUnits:[Dimension] = [UnitLength.meters, UnitLength.kilometers, UnitLength.miles,UnitLength.centimeters, UnitLength.millimeters, UnitLength.yards, UnitLength.inches]
            let length = Conversion(name: "Length", icon: UIImage(named: "Length")!, segueID: "goToWeightConversions", cellColour: UIColor(red: 111 / 255, green: 124 / 255, blue: 241 / 255, alpha: 1.00), dimensionArray: lengthUnits)

            let speedUnits:[Dimension] = [UnitSpeed.metersPerSecond, UnitSpeed.kilometersPerHour, UnitSpeed.milesPerHour, UnitSpeed.knots]
            let speed = Conversion(name: "Speed", icon: UIImage(named: "Speed")!, segueID: "goToWeightConversions", cellColour: UIColor(red: 246 / 255, green: 174 / 255, blue: 85 / 255, alpha: 1.00), dimensionArray: speedUnits)
            
            let volumeUnits:[Dimension] = [UnitVolume.cubicMillimeters, UnitVolume.cubicCentimeters, UnitVolume.cubicMeters]
            let volume = Conversion(name: "Volume", icon: UIImage(named: "Volume")!, segueID: "goToWeightConversions", cellColour: UIColor(red: 60 / 255, green: 190 / 255, blue: 146 / 255, alpha: 1.00), dimensionArray: volumeUnits)

            let liquidVolumeUnits:[Dimension] = [UnitVolume.gallons, UnitVolume.liters, UnitVolume.pints, UnitVolume.fluidOunces, UnitVolume.milliliters]
            let  liquidVolume = Conversion(name: "Liquid Volume", icon: UIImage(named: "LiquidVolume")!, segueID: "goToWeightConversions", cellColour: UIColor(red: 79 / 255, green: 135 / 255, blue: 238 / 255, alpha: 1.00), dimensionArray: liquidVolumeUnits)


            conversions += [weight, temperature, length, speed, volume, liquidVolume]

        }
        
       static func initPrecisions(){
        let twoDecimals = Precision(name: "Two Decimal Points", value: 100.0)
        let threeDecimals = Precision(name: "Three Decimal Points", value: 1000.0)
        let fourDecimals = Precision(name: "Four Decimal Points", value: 10000.0)
            
            precisions += [twoDecimals, threeDecimals, fourDecimals]
        
       }
        
        
        struct Strings{

        }
        
        struct Numeric{
            static let MAX_USER_DEFAULTS = 5
            static var CURRENT_PRECISION = 100.0
        }

    }
    

    
}

