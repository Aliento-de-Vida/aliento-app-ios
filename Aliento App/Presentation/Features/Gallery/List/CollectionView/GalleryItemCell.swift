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
    var onClick: (GalleryPresentation) -> Void = { _ in }
    
    func configure(item: GalleryPresentation, onClick: @escaping (GalleryPresentation) -> Void) {
        self.item = item
        self.onClick = onClick
        
        galleryImage.load(url: item.coverPicture)
        galleryLabel.text = "\(item.name)"
       
      
        galleryShadow.addShadow()
        galleryCard.roundCorners()
    
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let item = item else { return }
        onClick(item)
    }
    
}

