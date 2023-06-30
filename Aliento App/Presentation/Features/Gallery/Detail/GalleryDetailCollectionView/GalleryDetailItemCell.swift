//
//  GalleryDetailCollectionView.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 28/06/23.
//

import UIKit
import Resolver

class GalleryDetailItemCell : UICollectionViewCell {
    static let identifier = "GalleryDetailItemCell"
    
    
    @IBOutlet var imageGalleryItemCell: UIImageView!
    
    var item: String? = nil
    var onClick: (String) -> Void = { _ in}
    
    func configure(
        item: String,
        onClick: @escaping (String) -> Void
    ) {
        self.item = item
        self.onClick = onClick
        imageGalleryItemCell.load(url: item)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(DetailClick)))
        
    }
    
    @objc func DetailClick(_ sender: UITapGestureRecognizer) {
        guard let item = item else { return }
        onClick(item)
        print("Se presiono")
    }
}
