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
    @IBOutlet var emptyState: UIView!
    @IBOutlet var emptyStateMessage: UILabel!
    
    @IBOutlet var contentCampus: UIView!
    @IBOutlet var emptyStateImage: UIImageView!
    @IBOutlet var emptyStateScroll: UIScrollView!
    @IBOutlet var emptyStateScrollViewHeight: NSLayoutConstraint!
    
    @IBOutlet var progressIndicator: UIActivityIndicatorView!
    
    @Injected var campusRepository: CampusRepository
    var onClick: (CampusPresentation) -> Void = { item in }
    
    var campusesRefreshControl = UIRefreshControl()
    var emptyStateRefreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressIndicator.isHidden = false
                
        campusCollectionView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        campusCollectionView.register(UINib(nibName: CampusItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: CampusItemCell.identifier)
        campusCollectionView.dataSource = campusCollectionView
        campusCollectionView.delegate = campusCollectionView
        campusCollectionView.onClick = { [self] item in
            let goToDetailsCampus = DetailCampusVC.create(item: item)
            goToDetailsCampus.modalPresentationStyle = .popover
            self.present(goToDetailsCampus, animated: true, completion: nil)
        }
        
        configureRefreshControl()
        
        setNavBarLogo()
        
        updateCampusVC()
    }
    
    override func viewDidLayoutSubviews() {
        emptyStateScrollViewHeight.constant = emptyStateScroll.frame.height
        emptyState.layoutIfNeeded()
    }
    
    private func setCollectionViewState(campuses: [CampusPresentation]) {
        contentCampus.isHidden = false
        emptyStateScroll.isHidden = true
        
        self.campusCollectionView.collectionCampus = campuses
        self.campusCollectionView.reloadData()
    }

    private func setEmptyState(imageName: String , errorDescription: String ) {
        contentCampus.isHidden = true
        emptyStateScroll.isHidden = false
        
        emptyStateImage.image = UIImage(named: imageName)
        emptyStateMessage.text = errorDescription
        
    }
    
    func setNavBarLogo() {
        let image = UIImage(named: "logo_blanco")!.withTintColor(UIColor(named: "on_background")!, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        self.navigationItem.titleView = imageView
    }
    
  
    func configureRefreshControl() {
        campusCollectionView.refreshControl = campusesRefreshControl
        campusCollectionView.refreshControl?.addTarget(self, action: #selector(updateCampusVC), for: .valueChanged)
        emptyStateScroll.refreshControl = emptyStateRefreshControl
        emptyStateScroll.refreshControl?.addTarget(self, action: #selector(updateCampusVC), for: .valueChanged)
    }
    
    @objc func updateCampusVC() {
        self.campusesRefreshControl.beginRefreshing()
        self.emptyStateRefreshControl.beginRefreshing()

        campusRepository.getCampus { result in
            self.progressIndicator.isHidden = false
            self.campusesRefreshControl.endRefreshing()
            self.emptyStateRefreshControl.endRefreshing()

            switch result {
            case.success(let campus):
                let campuses = campus.map { value in value.toPresentation() }
                
                if (campuses.isEmpty) {
                    self.setEmptyState(imageName: "error", errorDescription: "No hay campus en este momento")
                } else {
                    self.setCollectionViewState(campuses: campuses)
                }
                
            case .failure(_):
                self.setEmptyState(imageName: "error", errorDescription: "Algo salio mal, vuelve a interlo mas tarde")
            }
        }
    }
    
    
    
}

