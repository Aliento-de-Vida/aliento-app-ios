//
//  DetailVC.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 26/06/23.
//

import UIKit
import Resolver

class DetailItemCell : UICollectionViewCell {
    static let identifier = "DetailItemCell"
    
    @IBOutlet var detailImage: UIImageView!
    
    var item: NotificationPresentation? = nil
    var onClick : (NotificationPresentation) -> Void = { _ in }
    
    func configure(
        item: NotificationPresentation,
        onClick: @escaping (NotificationPresentation) -> Void = { _ in }
    ) {
        
        self.item = item
        self.onClick = onClick
        detailImage.load(url: item.imageUrl)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
    }
    

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let item = item else { return }
        onClick(item)
        print("Se presiono \(item.imageUrl)")
    }
    
}


