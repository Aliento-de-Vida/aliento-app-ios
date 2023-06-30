//
//  NotificationsItemCell.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 19/01/23.
//

import UIKit

class NotificationsItemCell: UICollectionViewCell {
    static let identifier = "NotificationsItemCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet var shadow: UIView!
    @IBOutlet var card: UIView!
    
    var item: NotificationPresentation? = nil
    var onClick: (NotificationPresentation) -> Void = { _ in }
    
    func configure(item: NotificationPresentation, onClick: @escaping (NotificationPresentation) -> Void ) {
        self.item = item
        self.onClick = onClick
       
        imageView.load(url: item.imageUrl)
        title.text = "\(item.title)"
        descriptionLabel.text = "\(item.phrase)"
        date.text = item.date
    
        shadow.addShadow()
        card.roundCorners()
    
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let item = item else { return }
        onClick(item)
        print("Se presiono \(item.imageUrl)")
    }
    
}
