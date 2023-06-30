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
    var onTap: (AudioModelPresentation) -> Void = { _ in }
    
    func configure(
        item: AudioModelPresentation,
        onTap : @escaping (AudioModelPresentation) -> Void
    ) {
        
        self.item = item
        self.onTap = onTap
        nameLabel.text = item.title
        durationLabel.text = "\(item.duration)"
        imageView.load(url: item.imageUrl)
        dateLabel.text = item.releaseDate
        shadow.addShadow()
        background.roundCorners()
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SpotifyClick(_:))))
    }
    
    @objc func SpotifyClick(_ sender: UITapGestureRecognizer) {
        guard let item = item else { return }
        onTap(item)
        print("Se presiono \(item.spotify)")
    }
        
}
