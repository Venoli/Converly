//
//  SettingsViewController.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-08.
//

import UIKit

class SettingsViewController: UIViewController {
    

    @IBOutlet weak var precisionPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register picker items
        self.precisionPicker.delegate = self
        self.precisionPicker.dataSource = self
        
        //Generate data
        Constants.Content.initPrecisions()
        
    }
    
    

 
}

extension SettingsViewController: UIPickerViewDelegate{
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Constants.Content.Numeric.CURRENT_PRECISION = Constants.Content.precisions[row].getValue()
        print(Constants.Content.Numeric.CURRENT_PRECISION)
    }
}

extension SettingsViewController: UIPickerViewDataSource{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        3
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
  
        let label = UILabel()
      

        label.attributedText = NSAttributedString(string: Constants.Content.precisions[row].getName(), attributes: Constants.Design.Font.appFontAttribute)
        label.textColor = Constants.Design.Color.appColor
        label.textAlignment = .center
        label.layoutMargins = UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0);
        label.backgroundColor = Constants.Design.Color.appColorLight
        return label
      }
    
    
}
