//
//  CampusCollectionView.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 25/01/23.
//

import UIKit

class CampusCollectionView: UICollectionView {
    var collectionCampus: [CampusPresentation] = []
    var onClick: (CampusPresentation) -> Void = { campus in }
}

extension CampusCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.SCREEN_WIDTH, height: 200)
    }
        
}

extension CampusCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { collectionCampus.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CampusItemCell.identifier, for: indexPath) as! CampusItemCell
        let index = indexPath.item
        cell.configure(item: collectionCampus[index], onClick : onClick)
        return cell
    }
    
}
