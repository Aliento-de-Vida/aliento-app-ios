//
//  Gallery.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 19/01/23.
//

import UIKit
import Resolver

class GalleryListVC : UIViewController {
    @IBOutlet var gallerylistCollectionView: GalleryListCollectionView!
    @Injected var galleryRepository : GalleryRepository
    var onClick: (String) -> Void = { item in  }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gallerylistCollectionView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        gallerylistCollectionView.register(UINib(nibName: GalleryItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: GalleryItemCell.identifier)
        gallerylistCollectionView.dataSource = gallerylistCollectionView
        gallerylistCollectionView.delegate = gallerylistCollectionView
        gallerylistCollectionView.onClick = { item in
            let goToGalleryDetails = GalleryDetailVC.create(item: item)
            goToGalleryDetails.modalPresentationStyle = .popover
            self.present(goToGalleryDetails, animated: true, completion: nil)
            //self.navigationController?.pushViewController(GalleryDetailVC(), animated: true)
        }
       
        setNavBarLogo()
        galleryRepository.getGallery { result in
            switch result {
            case .success(let gallery):
                let campusPresentation = gallery.map { value in value.toPresentation() }
                self.gallerylistCollectionView.collectionGallery = campusPresentation
                self.gallerylistCollectionView.reloadData()
                
            case .failure(let error):
                print("Error")
            }
        }
        
        gallerylistCollectionView.isUserInteractionEnabled = true
        gallerylistCollectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToGalleryDetails)))
    }
    
    
    func setNavBarLogo() {
        let image = UIImage(named: "logo_blanco")!.withTintColor(UIColor(named: "on_background")!, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        self.navigationItem.titleView = imageView
    }
    
    @objc func goToGalleryDetails() {
        let galleryDetailVC = GalleryDetailVC()
        galleryDetailVC.modalPresentationStyle = .popover
        self.present(galleryDetailVC, animated: true, completion: nil)
        //navigationController?.pushViewController(ChurchVC(), animated: true)
        print("Se presiono card one")
        // handling code
        
    }
    
}

