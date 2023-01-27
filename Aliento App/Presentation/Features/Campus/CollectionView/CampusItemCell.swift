//
//  CampusItemCell.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 25/01/23.
//

import UIKit

class CampusItemCell: UICollectionViewCell {
    static let identifier = "CampusItemCell"
    
    
    @IBOutlet var shadowCampus: UIView!
    @IBOutlet var cardCampus: UIView!
    @IBOutlet var imageUrl: UIImageView!
    @IBOutlet var campusTitle: UILabel!
    @IBOutlet var campusPhrase: UILabel!
    
    var item: Campus? = nil
    
    func configure(item: Campus) {
        self.item = item
       
        imageUrl.load(url: item.imageUrl)
        campusTitle.text = "\(item.title)"
        campusPhrase.text = "\(item.phrase)"
      
        shadowCampus.addShadow()
        cardCampus.roundCorners()
    
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("Se presiono \(item?.imageUrl)")
    }
    
    
}

