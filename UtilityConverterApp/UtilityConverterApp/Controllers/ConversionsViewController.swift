//
//  ConversionsViewController.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-08.
//

import UIKit

class ConversionsViewController: UICollectionViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Constants.Content.initConversions()
        setUpMosaicLayout()
        
    }
    
    func setUpMosaicLayout(){
        // Setup the mosaic collection view.
        let mosaicLayout = MosaicLayout()
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: mosaicLayout)
        collectionView.backgroundColor = Constants.Design.Color.appWhite
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.alwaysBounceVertical = true
        collectionView.indicatorStyle = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        // Register Cells
        collectionView.register(UINib(nibName: "Card", bundle: nil), forCellWithReuseIdentifier: Card.identifer)
        self.view.addSubview(collectionView)

        

    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if collectionView.numberOfItems(inSection: 0) > 0 {
            collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
        }
        
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.Content.conversions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // Initializing a reusable sell
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Card", for: indexPath) as! Card

      print(indexPath)
        print(indexPath.item)
        //Initializing cell content and assigning data source
        cell.setData(lebelText: Constants.Content.conversions[indexPath.row].getName(),image: Constants.Content.conversions[indexPath.row].getIcon(), cardColor: Constants.Content.conversions[indexPath.row].getCellColour())
       
        //Initializing cell content and assigning data source
        cell.contentView.layer.cornerRadius = 15.0
        cell.contentView.layer.borderWidth = 2.0
        //cell.contentView.layoutMargins = UIEdgeInsets()
        cell.contentView.layer.borderColor = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 0.50).cgColor
        cell.contentView.layer.masksToBounds = false
      

        return cell
    }
  
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.Content.conversions[indexPath.row].getSegueID(), sender: self)
      //  let viewControllerB = WeightViewController()
       // viewControllerB.conversion = "Taylor Swift"
     //   viewControllerB.delegate = self
//        navigationController?.pushViewController(viewControllerB, animated: true)
        
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWeightConversions" {
            if let itemIndex = collectionView.indexPathsForSelectedItems?.first?.row {
                //let controller = segue.destination as! WeightViewController
                WeightViewController.conversion = Constants.Content.conversions[itemIndex]
            }
        }
    }
}


