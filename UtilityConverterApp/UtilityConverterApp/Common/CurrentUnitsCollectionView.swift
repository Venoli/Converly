//
//  CurrentUnitsCollectionView.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-14.
//
import UIKit

class CurrentUnitsCollectionView {
    
    private var unitsCollectionView:UnitsCollectionView?
    public static let sharedInstance = CurrentUnitsCollectionView()
    
    public func set(value:UnitsCollectionView, key:String){
        unitsCollectionView = value
       }

       public func get(key:String) -> UnitsCollectionView?{
        unitsCollectionView
       }
}
