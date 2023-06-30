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
    
    var onClick: (CarouselItem) -> Void = { _ in }
    var item: CarouselItem? = nil
    
    func configure(item: CarouselItem, onClick: @escaping (CarouselItem) -> Void) {
        self.item = item
        self.onClick = onClick
        
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
        guard let item = item else { return }
        onClick(item)
    }
}
