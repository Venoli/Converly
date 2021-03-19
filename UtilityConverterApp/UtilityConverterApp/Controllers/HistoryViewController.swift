//
//  HistoryViewController.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-08.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet var segmentedController: UISegmentedControl!
    @IBOutlet weak var historyCollectionView: UICollectionView!
    var conversionHistories = [ConversionSave]()
    var selectedConversion = Conversion()
    let cellMarginSize = 15.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.historyCollectionView.dataSource = self
        self.historyCollectionView.delegate = self

        // Register Cells
        self.historyCollectionView.register(UINib(nibName: "HistoryCard", bundle: nil), forCellWithReuseIdentifier: "HistoryCard")

        setupUI()
    }
    
   
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        DispatchQueue.main.async {
            self.historyCollectionView.reloadData()
            //self.setUpSegmentedController()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if historyCollectionView.numberOfItems(inSection: 0) > 0 {
            historyCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
        }
        setupUI()
    }
    
    private func setupUI(){
        //Collection view
        self.historyCollectionView.frame = self.view.bounds
        
        //Segmeted controller
        selectedConversion = Constants.Content.conversions[0]
        setUpSegmentedController()
        
    }
    @objc func navigateBack(){
        self.tabBarController!.selectedIndex = 0


    }
    @objc func switchToDataTabCont(){
        tabBarController!.selectedIndex = 0
    }
    private func setUpSegmentedController(){
        
        for (index,conversion) in  Constants.Content.conversions.enumerated(){
            
            segmentedController.setTitle(conversion.getName(), forSegmentAt: index)

        }
        //Retrieve saved data
        conversionHistories =  DataTransfer.retrieveHistories(key:selectedConversion.getName())
    }
    
    @IBAction func segmentedControllerChanged(_ sender: UISegmentedControl) {
 
        selectedConversion = Constants.Content.conversions[segmentedController.selectedSegmentIndex]
        conversionHistories =  DataTransfer.retrieveHistories(key:selectedConversion.getName())
        DispatchQueue.main.async { self.historyCollectionView.reloadData()
            
        }
    }
    
}


// MARK: - Extenstions of protocol stubs related to the history collection view

extension HistoryViewController: UICollectionViewDataSource {
    /// Return - calculation count to be used to populate the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.conversionHistories.count
    }
    
    /// Generate - calculation collection view cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /// Initializing a reusable sell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HistoryCard", for: indexPath) as! HistoryCard
        
        /// Initializing cell content and assigning data source
        cell.setData(image: selectedConversion.getIcon(), conversionData: conversionHistories[indexPath.row].getUnitSaveArray())
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        let width = bounds.size.width
//        cell.conversionIcon.layer.bounds.width = width/7
//        cell.conversionIcon.layer.bounds.height = width/7
        cell.contentView.layer.bounds.size.height = height/4
//            cell.historyDescription.layer.bounds.height + 20
        cell.contentView.layer.bounds.size.width = width - 30
        cell.contentView.layer.cornerRadius = 15.0
//        cell.contentView.layer.masksToBounds = false

        return cell
    }
    

}

extension HistoryViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                let bounds = UIScreen.main.bounds
        let width = bounds.size.width - collectionView.contentInset.right - collectionView.contentInset.right - 30.0
                let height = bounds.size.height/4

        return CGSize(width: width, height: height)
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let bounds = UIScreen.main.bounds
//        let width = collectionView.bounds.size.width - collectionView.contentInset.right - collectionView.contentInset.right - 30.0
//        let width = self.calculateWidth(estimateWidth:Double(width))
//        return CGSize(width: width, height: width)
//    }
//
//    func calculateWidth(estimateWidth:Double) -> CGFloat {
//
//        let estimatedWidth = CGFloat(estimateWidth)
//        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
//
//        let margin = CGFloat(cellMarginSize * 2)
//        let width = (self.view.frame.size.width - CGFloat(self.cellMarginSize) * (cellCount - 1) - margin) / cellCount
//
//        return width
//    }
}


