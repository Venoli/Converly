//
//  ConversionsViewController.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-08.
//

import UIKit

class ConversionsViewController: UICollectionViewController {
    
    
    var conversions = [Conversion]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateCalculations()

        setUpMosaicLayout()
                
        // Setup GridView
        //self.setupGridView()
        
        //Generate Calculations
       // self.generateCalculations()
    }
    
    func setUpMosaicLayout(){
        // Setup the mosaic collection view.
        let mosaicLayout = MosaicLayout()
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: mosaicLayout)
        collectionView.backgroundColor = Constants.Design.Color.appBackgroundColor
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.alwaysBounceVertical = true
        collectionView.indicatorStyle = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        // Register Cells
        collectionView.register(UINib(nibName: "Card", bundle: nil), forCellWithReuseIdentifier: Card.identifer)
        self.view.addSubview(collectionView)

        

    }
    func setupGridView() {
       // let flow = conversionCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
      //  flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        //flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
    func generateCalculations() {
        let weight = Conversion(name: "Weight", icon: UIImage(named: "baseline_settings_black_24pt")!, segueID: "goToWeightConversions", cellColour: UIColor(red: 39 / 255, green: 180 / 255, blue: 175 / 255, alpha: 1.00))
        let temperature = Conversion(name: "Temperature", icon: UIImage(named: "baseline_settings_black_24pt")!, segueID: "goToLoansCalculation", cellColour: UIColor(red: 239 / 255, green: 119 / 255, blue: 109 / 255, alpha: 1.00))
        let length = Conversion(name: "Length", icon: UIImage(named: "baseline_settings_black_24pt")!, segueID: "goToMortgageCalculation", cellColour: UIColor(red: 111 / 255, green: 124 / 255, blue: 241 / 255, alpha: 1.00))
        
        let speed = Conversion(name: "Speed", icon: UIImage(named: "baseline_settings_black_24pt")!, segueID: "goToSavingsCalculation", cellColour: UIColor(red: 246 / 255, green: 174 / 255, blue: 85 / 255, alpha: 1.00))
        let volume = Conversion(name: "Volume", icon: UIImage(named: "baseline_settings_black_24pt")!, segueID: "goToLoansCalculation", cellColour: UIColor(red: 60 / 255, green: 190 / 255, blue: 146 / 255, alpha: 1.00))
        let  liquidVolumes = Conversion(name: "Liquid Volume", icon: UIImage(named: "baseline_settings_black_24pt")!, segueID: "goToMortgageCalculation", cellColour: UIColor(red: 79 / 255, green: 135 / 255, blue: 238 / 255, alpha: 1.00))

        
        conversions += [weight, temperature, length, speed, volume, liquidVolumes]
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if collectionView.numberOfItems(inSection: 0) > 0 {
            collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
        }
        
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return conversions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // Initializing a reusable sell
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Card", for: indexPath) as! Card

      print(indexPath)
        print(indexPath.item)
        //Initializing cell content and assigning data source
        cell.setData(lebelText: self.conversions[indexPath.row].getName(),image: self.conversions[indexPath.row].getIcon(), cardColor: self.conversions[indexPath.row].getCellColour())
       
        //Initializing cell content and assigning data source
        cell.contentView.layer.cornerRadius = 15.0
        cell.contentView.layer.borderWidth = 2.0
        //cell.contentView.layoutMargins = UIEdgeInsets()
        cell.contentView.layer.borderColor = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 0.50).cgColor
        cell.contentView.layer.masksToBounds = false
      

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: self.conversions[indexPath.row].getSegueID(), sender: self)
    }
    
    
    
}


