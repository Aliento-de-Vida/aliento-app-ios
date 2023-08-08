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
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var contentGallery: UIView!
    @IBOutlet var emptyStateScroll: UIScrollView!
    @IBOutlet var emptyState: UIView!
    @IBOutlet var emptyStateImage: UIImageView!
    @IBOutlet var emptyStateMessage: UILabel!
    
    
    
    @Injected var galleryRepository : GalleryRepository
    var onClick: (String) -> Void = { item in  }
    var refreshControl = UIRefreshControl()
    
    var galleryRefreshControl = UIRefreshControl()
    var emptyStateRefreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emptyStateScroll.isHidden = true
        contentGallery.isHidden = true
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        updateGallery()
        
        gallerylistCollectionView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        gallerylistCollectionView.register(UINib(nibName: GalleryItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: GalleryItemCell.identifier)
        gallerylistCollectionView.dataSource = gallerylistCollectionView
        gallerylistCollectionView.delegate = gallerylistCollectionView
        gallerylistCollectionView.onClick = { item in
            let goToGalleryDetails = GalleryDetailVC.create(item: item)
            goToGalleryDetails.modalPresentationStyle = .popover
            self.present(goToGalleryDetails, animated: true, completion: nil)
        
        }
        
        configureRefreshControl()
        setNavBarLogo()
        
        
        
        galleryRepository.getGallery { result in
            switch result {
            case .success(let gallery):
                let campusPresentation = gallery.map { value in value.toPresentation() }
                self.gallerylistCollectionView.collectionGallery = campusPresentation
                
                self.gallerylistCollectionView.reloadData()
                
                
            case .failure(_):
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
    
    private func setCollectionViewState(gallery : [GalleryPresentation]) {
        contentGallery.isHidden = false
        emptyStateScroll.isHidden = true
        
        self.gallerylistCollectionView.collectionGallery = gallery
        self.gallerylistCollectionView.reloadData()
    }
    
    private func setEmptyState(imageName: String, errorDescription: String ) {
        contentGallery.isHidden = true
        emptyStateScroll.isHidden = false
        
        emptyStateImage.image = UIImage(named: imageName)
        emptyStateMessage.text = errorDescription
    }
    
    func configureRefreshControl() {
        gallerylistCollectionView.refreshControl = galleryRefreshControl
        gallerylistCollectionView.refreshControl?.addTarget(self, action: #selector(refreshGallery), for: .valueChanged)
        emptyStateScroll.refreshControl = emptyStateRefreshControl
        emptyStateScroll.refreshControl?.addTarget(self, action: #selector(refreshGallery), for: .valueChanged)
    }
    
    @objc func refreshGallery() {
        self.galleryRefreshControl.beginRefreshing()
        self.emptyStateRefreshControl.beginRefreshing()
        
        updateGallery()
    }
    
    @objc func updateGallery() {
            galleryRepository.getGallery { result in
                self.hideIndicators()
                
                switch result {
                case.success(let gallery):
                    let galleryPresentation = gallery.map { value in value.toPresentation() }
                    
                    
                    if (galleryPresentation.isEmpty) {
                        self.setEmptyState(imageName: "Empty State", errorDescription: "No hay fotos en este momento")
                    } else {
                        self.setCollectionViewState(gallery: galleryPresentation)
                    }
                
                case .failure(_):
                    self.setEmptyState(imageName: "Empty State", errorDescription: "Algo salio mal, vuelve a intentarlo mas tarde")
                    print("Error")
                }
                
            }
        
    }
    
    func hideIndicators() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        galleryRefreshControl.endRefreshing()
        emptyStateRefreshControl.endRefreshing()
        
    }
    
}

