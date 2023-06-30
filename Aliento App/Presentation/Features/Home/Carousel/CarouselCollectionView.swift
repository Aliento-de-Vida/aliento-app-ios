//
//  HomeCollectionView.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 11/01/23.
//

import UIKit

class CarouselCollectionView: UICollectionView {
    var collectionCarousel: [CarouselItem] = []
    var onClick: (CarouselItem) -> Void = { _ in }
}

extension CarouselCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.SCREEN_WIDTH, height: 180)
    }
        
}

extension CarouselCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { collectionCarousel.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselItemCell.identifier, for: indexPath) as! CarouselItemCell
        let index = indexPath.item
        cell.configure(item: collectionCarousel[index], onClick: onClick)
        return cell
    }
    
}
  
