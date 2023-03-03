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
    
    var item: GalleryPresentation? = nil
    
    
    func configure(item: GalleryPresentation) {
        self.item = item
       
        galleryImage.load(url: item.coverPicture)
        galleryLabel.text = "\(item.name)"
       
      
        galleryShadow.addShadow()
        galleryCard.roundCorners()
    
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("Se presiono \(item?.coverPicture)")
    }
    
}

