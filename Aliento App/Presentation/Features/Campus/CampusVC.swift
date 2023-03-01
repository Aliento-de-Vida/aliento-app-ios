//
//  CampusVC.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 18/01/23.
//

import UIKit
import Resolver

class CampusVC : UIViewController {
    @IBOutlet var campusCollectionView: CampusCollectionView!
    @Injected var campusRepository: CampusRepository
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        campusCollectionView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        campusCollectionView.register(UINib(nibName: CampusItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: CampusItemCell.identifier)
        campusCollectionView.dataSource = campusCollectionView
        campusCollectionView.delegate = campusCollectionView
    
        setNavBarLogo()
        campusRepository.getCampus { result in
            switch result {
            case.success(let campus):
                let campusPresentation = campus.map { value in value.toPresentation() }
                self.campusCollectionView.collectionCampus = campusPresentation
                self.campusCollectionView.reloadData()
                
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

