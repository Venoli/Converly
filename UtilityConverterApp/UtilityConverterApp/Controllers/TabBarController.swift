//
//  TabBarController.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-18.
//

import Foundation
import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UITabBarController subclass to handle its methods
        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController is UINavigationController{
            print("Current app view: Conversions Tab")
        } else if viewController is HistoryViewController{
            print("Current app view: History Tab")
        } else if viewController is SettingsViewController{
            print("Current app view: Settings Tab")
        }
    }
}



