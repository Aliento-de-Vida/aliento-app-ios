//
//  GalleryItemCell.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 25/01/23.
//

import UIKit

class GalleryItemCell : UICollectionViewCell {
    static let identifier = "GalleryItemCell"
    
    
    @IBOutlet var galleryShadow: UIView!
    @IBOutlet var galleryCard: UIView!
    @IBOutlet var galleryImage: UIImageView!
    @IBOutlet var galleryLabel: UILabel!
    
    var item: Gallery? = nil
    
    
    func configure(item: Gallery) {
        self.item = item
       
        galleryImage.load(url: item.imageUrl)
        galleryLabel.text = "\(item.phrase)"
       
      
        galleryShadow.addShadow()
        galleryCard.roundCorners()
    
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("Se presiono \(item?.imageUrl)")
    }
    
}

