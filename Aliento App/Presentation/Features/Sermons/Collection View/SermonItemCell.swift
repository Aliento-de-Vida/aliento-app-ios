//
//  SermonItem.swift
//  Aliento App
//
//  Created by Pedro Antonio on 09/11/22.
//

import Foundation
import UIKit

class SermonItemCell: UICollectionViewCell {
    static let identifier = "SermonItemCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    func configure(item: Sermon) {
        nameLabel.text = item.name
        durationLabel.text = "\(item.duration)"
    }
        
}
