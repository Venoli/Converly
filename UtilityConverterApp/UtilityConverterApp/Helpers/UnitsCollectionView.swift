//
//  UnitsCollectionView.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-14.
//
import UIKit

class UnitsCollectionView: UICollectionViewController {
    
   
    @IBOutlet var unitsCardCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        self.unitsCardCollectionView.delegate = self
        self.unitsCardCollectionView.dataSource = self
        CurrentUnitsCollectionView.sharedInstance.set(value: self, key: "UnitsCollectionView") 
        
        
        // Register Cells
        self.unitsCardCollectionView.register(UINib(nibName: "UnitInput", bundle: nil), forCellWithReuseIdentifier: "UnitInput")
        
        // Setup UI
        self.setupUI()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if collectionView.numberOfItems(inSection: 0) > 0 {
            collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
        }
    }
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        self.setupUI()
//        DispatchQueue.main.async {
//            self.unitsCardCollectionView.reloadData()
//        }
//    }
    
    
    func setupUI(){
        
        self.unitsCardCollectionView.frame = self.view.bounds
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return WeightViewController.conversion.getUnitsArray().count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UnitInput", for: indexPath) as! UnitInput
        let parentVC = parent as! WeightViewController
        cell.setData(unit: WeightViewController.conversion.getUnitsArray()[indexPath.row])
        cell.amount.tag = indexPath.row
        parentVC.setCustomNumericKeyboard(textField: cell.amount)
       
        cell.contentView.layer.cornerRadius = 15.0
      
        WeightViewController.conversion.getUnitsArray()[indexPath.row].textField = cell.amount
        return cell
    }
    
     static func calculateMeasures(value:Double, tag:Int){
        let fromUnit = WeightViewController.conversion.getUnitsArray()[tag].getUnit()
        let userInput = Measurement(value:value, unit:fromUnit)

        for toUnit in WeightViewController.conversion.getUnitsArray() {
            if (fromUnit != toUnit.getUnit()){
            let convertedValue = userInput.converted(to:toUnit.getUnit())
            toUnit.setValue(value: convertedValue.value)
            }
        }

    }
    
    static func saveMeasure(value:Double, tag:Int){
       WeightViewController.conversion.getUnitsArray()[tag].setValue(value: value)
    }
  
}
