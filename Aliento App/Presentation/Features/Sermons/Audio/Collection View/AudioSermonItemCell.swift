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
    @IBOutlet var shadow: UIView!
    
    var item: AudioModelPresentation? = nil
    
    func configure(item: AudioModelPresentation) {
        self.item = item
        
        nameLabel.text = item.title
        durationLabel.text = "\(item.duration)"
        imageView.load(url: item.imageUrl)
        dateLabel.text = item.releaseDate
        shadow.addShadow()
        background.roundCorners()
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("Se presiono \(item?.title)")
    }
        
}
