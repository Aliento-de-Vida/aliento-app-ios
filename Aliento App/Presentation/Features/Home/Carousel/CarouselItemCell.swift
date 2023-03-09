//
//  CarouselItemCell.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 12/01/23.
//

import UIKit
    
class CarouselItemCell: UICollectionViewCell {
    static let identifier = "CarouselItemCell"
    @IBOutlet var carouselImage: UIImageView!
    @IBOutlet var form: UIView!
    @IBOutlet var textLabel: UILabel!
    
    func configure(item: CarouselItem) {
        carouselImage.load(url: item.imageUrl)
        
        carouselImage.isUserInteractionEnabled = true
        carouselImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(carouselImageClick)))
        form.roundRightCorners()
        
        if (item.menu != nil) {
            textLabel.text = item.menu?.menuName
        }
        if (item.video != nil) {
            textLabel.text = "Ver videos"
        }
    }
    
    @objc func carouselImageClick() {
        print("Se presiono carousel image")
        // handling code
    }
}
