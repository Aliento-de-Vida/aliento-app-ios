//
//  VideoSermonItemCell.swift
//  Aliento App
//
//  Created by Pedro Antonio on 10/01/23.
//

import UIKit

class VideoSermonItemCell: UICollectionViewCell {
    static let identifier = "VideoSermonItemCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var card: UIView!
    @IBOutlet weak var shadow: UIView!
    
    var item: VideoModelPresentation? = nil
    
    func configure(item: VideoModelPresentation) {
        self.item = item
        
        nameLabel.text = item.title
        durationLabel.text = "\(item.description)"
        imageView.load(url: item.thumbnulsUrl)
        dateLabel.text = item.date
                
        card.roundCorners()
        shadow.addShadow()
     
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("Se presiono \(item?.id)")
    }
        
}

