//
//  SermonItem.swift
//  Aliento App
//
//  Created by Pedro Antonio on 09/11/22.
//

import Foundation
import UIKit

class AudioSermonItemCell: UICollectionViewCell {
    static let identifier = "AudioSermonItemCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var background: UIView!
    
    var item: AudioSermon? = nil
    
    func configure(item: AudioSermon) {
        self.item = item
        
        nameLabel.text = item.name
        durationLabel.text = "\(item.duration)"
        imageView.layer.cornerRadius = imageView.layer.frame.width/2
        imageView.load(url: item.imageUrl)
        
        background.roundCorners()
        background.addShadow()
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("Se presiono \(item?.name)")
    }
        
}
