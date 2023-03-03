//
//  Gallery.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 19/01/23.
//

import UIKit
import Resolver

class GalleryVC : UIViewController {
    @IBOutlet var galleryCollectionView: GalleryCollectionView!
    @Injected var galleryRepository : GalleryRepository
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        galleryCollectionView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        galleryCollectionView.register(UINib(nibName: GalleryItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: GalleryItemCell.identifier)
        galleryCollectionView.dataSource = galleryCollectionView
        galleryCollectionView.delegate = galleryCollectionView
       
        setNavBarLogo()
        galleryRepository.getGallery { result in
            switch result {
            case .success(let gallery):
                let campusPresentation = gallery.map { value in value.toPresentation() }
                self.galleryCollectionView.collectionGallery = campusPresentation
                self.galleryCollectionView.reloadData()
                
            case .failure(let error):
                print("Error")
            }
        }
    }
    
    
    func setNavBarLogo() {
        let image = UIImage(named: "logo_blanco")!.withTintColor(UIColor(named: "on_background")!, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        self.navigationItem.titleView = imageView
    }
    
}

