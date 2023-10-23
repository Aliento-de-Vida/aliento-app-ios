//
//  GalleryCollectionView.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 28/06/23.
//

import UIKit

class GalleryDetailCollectionView : UICollectionView {
    let ITEM_HEIGHT = 200.0
    var galleryDetailCollectionView: [String] = []
    var onClick: (String) -> Void = { gallery in }
}

extension GalleryDetailCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.layer.bounds.width/3
        return CGSize(width: width , height: ITEM_HEIGHT)
    }
        
}

extension GalleryDetailCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { galleryDetailCollectionView.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryDetailItemCell.identifier, for: indexPath) as! GalleryDetailItemCell
        let index = indexPath.item
        cell.configure(item: galleryDetailCollectionView[index], onClick: onClick)
        return cell
    }
    
}
