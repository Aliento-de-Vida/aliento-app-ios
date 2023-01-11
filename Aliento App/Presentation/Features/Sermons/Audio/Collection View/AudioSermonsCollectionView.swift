//
//  SermonsCollectionView.swift
//  Aliento App
//
//  Created by Pedro Antonio on 09/11/22.
//

import Foundation
import UIKit

class AudioSermonsCollectionView: UICollectionView {
    var collection: [AudioSermon] = []
}

extension AudioSermonsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.SCREEN_WIDTH, height: 130)
    }
        
}

extension AudioSermonsCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { collection.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AudioSermonItemCell.identifier, for: indexPath) as! AudioSermonItemCell
        let index = indexPath.item
        cell.configure(item: collection[index])
        return cell
    }
    
}
