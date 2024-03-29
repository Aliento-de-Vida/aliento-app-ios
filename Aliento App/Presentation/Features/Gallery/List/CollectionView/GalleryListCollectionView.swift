//
//  GalleryCollectionView.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 25/01/23.
//

import UIKit

class GalleryListCollectionView : UICollectionView {
    var collectionGallery: [GalleryPresentation] = []
    var onClick : (GalleryPresentation) -> Void = { galleryDetail in }
}

extension GalleryListCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.SCREEN_WIDTH, height: 200)
    }
        
}

extension GalleryListCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { collectionGallery.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryItemCell.identifier, for: indexPath) as! GalleryItemCell
        let index = indexPath.item
        cell.configure(item: collectionGallery[index], onClick: onClick)
        return cell
    }
    
}
