//
//  VideoSermonsCollectionView.swift
//  Aliento App
//
//  Created by Pedro Antonio on 10/01/23.
//

import UIKit

class VideoSermonsCollectionView: UICollectionView {
    var collectionVideo: [VideoModelPresentation] = []
    var onTap : (VideoModelPresentation) -> Void = { _ in }
}

extension VideoSermonsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.SCREEN_WIDTH, height: 200)
    }
        
}

extension VideoSermonsCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { collectionVideo.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoSermonItemCell.identifier, for: indexPath) as! VideoSermonItemCell
        let index = indexPath.item
        cell.configure(item: collectionVideo[index], onTap: onTap)
        return cell
    }
    
}
    
