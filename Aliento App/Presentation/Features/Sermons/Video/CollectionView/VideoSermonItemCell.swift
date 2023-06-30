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
    var onTap: (VideoModelPresentation) -> Void = { _ in }
    
    func configure(
        item: VideoModelPresentation,
        onTap: @escaping (VideoModelPresentation) -> Void
    ) {
        
        self.item = item
        self.onTap = onTap
        nameLabel.text = item.title
        durationLabel.text = "\(item.description)"
        imageView.load(url: item.thumbnulsUrl)
        dateLabel.text = item.date
                
        card.roundCorners()
        shadow.addShadow()
     
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let item = item else { return }
        onTap(item)
        print("Se presiono \(item.id)")
    }
        
}

