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
    
    var onPageSelected: (Int) -> Void = { _ in }
    private var selectedPage = 0
    
    func scrollToNextCell() {
        self.selectedPage = selectedPage + 1
        if (selectedPage >= self.collectionCarousel.count) {
            selectedPage = 0
        }
        
        self.scrollToItem(
            at: IndexPath.init(item: selectedPage, section: 0),
            at: UICollectionView.ScrollPosition.centeredHorizontally,
            animated: true
        )
        onPageSelected(selectedPage)
    }
}

extension CarouselCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.SCREEN_WIDTH, height: 180)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int((self.contentOffset.x / self.contentSize.width) * CGFloat(collectionCarousel.count))
        selectedPage = currentPage
        onPageSelected(selectedPage)
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
  
