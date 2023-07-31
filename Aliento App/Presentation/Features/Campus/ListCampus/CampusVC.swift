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
    var onClick: (CampusPresentation) -> Void = { item in }
    var refreshControl = UIRefreshControl()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        campusCollectionView.refreshControl = UIRefreshControl()
        campusCollectionView.refreshControl?.addTarget(self, action: #selector(callPullToRefresh), for: .valueChanged)
        campusCollectionView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        campusCollectionView.register(UINib(nibName: CampusItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: CampusItemCell.identifier)
        campusCollectionView.dataSource = campusCollectionView
        campusCollectionView.delegate = campusCollectionView
        campusCollectionView.onClick = { [self] item in
            let goToDetailsCampus = DetailCampusVC.create(item: item)
            goToDetailsCampus.modalPresentationStyle = .popover
            self.present(goToDetailsCampus, animated: true, completion: nil)
        }
        
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
        
        callPullToRefresh()
    }
    
    func setNavBarLogo() {
        let image = UIImage(named: "logo_blanco")!.withTintColor(UIColor(named: "on_background")!, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        self.navigationItem.titleView = imageView
    }
    
    @objc func callPullToRefresh(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.campusRepository.getCampus { result in
            switch result {
            case.success(let campus):
                let campusPresentation = campus.map { value in value.toPresentation() }
                self.campusCollectionView.collectionCampus = campusPresentation
                self.campusCollectionView.reloadData()
                
            case .failure(_):
                print("Error")
            }
         
            self.campusCollectionView.reloadData()
            self.campusCollectionView.refreshControl?.endRefreshing()
            }
        }
    }
    
}


//DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
