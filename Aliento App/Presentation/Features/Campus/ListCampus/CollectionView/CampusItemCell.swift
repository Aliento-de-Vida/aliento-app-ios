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
    
    var item: CampusPresentation? = nil
    var onClick: (CampusPresentation) -> Void = { _ in }
    
    func configure(item: CampusPresentation, onClick: @escaping (CampusPresentation) -> Void ) {
        self.item = item
        self.onClick = onClick
       
        imageUrl.load(url: item.imageUrl)
        campusTitle.text = "\(item.name)"
        campusPhrase.text = "\(item.description)"
      
        shadowCampus.addShadow()
        cardCampus.roundCorners()
    
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let item = item else { return }
        onClick(item)
        print("Se presiono \(item.imageUrl)")
    }
    
}

