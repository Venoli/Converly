//
//  Card.swift
//  UtilityConverterApp
//
//  Created by Venoli Gamage on 2021-03-09.
//

import UIKit
class Card: UICollectionViewCell {
    static let identifer = "Card"

    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardDescription: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    
    
    override func awakeFromNib() {
    super.awakeFromNib()

}
    
    
    func setData(lebelText: String,image: UIImage, cardColor: UIColor){
        self.cardLabel.text = lebelText
        self.cardDescription.text = Constants.Content.getConversionCardDescription(unit: lebelText)
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        self.cardImage.image = image
        self.cardImage.bounds.size.width = width/4
        self.contentView.backgroundColor = cardColor
    }
    

   
   
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        cardImage.image = nil
//        cardDescription = nil
//        cardLabel = nil
//
//    }
}
