//
//  NotificationsCollectionView.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 19/01/23.
//

import UIKit

class NotificationsCollectionView: UICollectionView {
    var collectionNotification: [NotificationPresentation] = []
    var onClick: (NotificationPresentation) -> Void = { notification in }
}

extension NotificationsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.SCREEN_WIDTH, height: 200)
    }
        
}

extension NotificationsCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { collectionNotification.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NotificationsItemCell.identifier, for: indexPath) as! NotificationsItemCell
        let index = indexPath.item
        cell.configure(item: collectionNotification[index], onClick: onClick)
        return cell
    }
    
}
    
