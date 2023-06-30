//
//  DetailModelPresentation .swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 26/06/23.
//

import UIKit

class DetailCollectionView : UICollectionView {
    var detailGallery: [NotificationPresentation] = []
    var onClick: (NotificationPresentation) -> Void = { notification in }
}

extension DetailCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.SCREEN_WIDTH, height: 200)
    }
        
}

extension DetailCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { detailGallery.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailItemCell.identifier, for: indexPath) as! DetailItemCell
        let index = indexPath.item
        cell.configure(item: detailGallery[index], onClick: onClick)
        return cell
    }
    
}
