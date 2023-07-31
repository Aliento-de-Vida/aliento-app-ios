//
//  Notifications.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 19/01/23.
//

import UIKit
import Resolver

class NotificationsVC : UIViewController {
    
    @IBOutlet weak var notificationsCollectionView: NotificationsCollectionView!
    @Injected var notificationRepository: NotificationRepository
    var onClick: (NotificationPresentation) -> Void = { item in }
    
    var labelText : String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationsCollectionView.refreshControl = UIRefreshControl()
        notificationsCollectionView.refreshControl?.addTarget(self, action: #selector(callPullToRefresh), for: .valueChanged)
        notificationsCollectionView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        notificationsCollectionView.register(UINib(nibName: NotificationsItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: NotificationsItemCell.identifier)
        notificationsCollectionView.dataSource = notificationsCollectionView
        notificationsCollectionView.delegate = notificationsCollectionView
        notificationsCollectionView.onClick = { [self] item in
            let goToDetailsNotification = NotificationDetailVC.create(item: item)
            goToDetailsNotification.modalPresentationStyle = .popover
            self.present(goToDetailsNotification, animated: true, completion: nil)
        }
        
        setNavBarLogo()
        notificationRepository.getNotification { [self] result in
            switch result {
            case .success(let notifications):
                let notificationsPresentation = notifications.map { value in value.toPresentation() }
                self.notificationsCollectionView.collectionNotification = notificationsPresentation
                self.notificationsCollectionView.reloadData()
                
            case .failure(let error):
                print("Error")
            }
        }
   
        callPullToRefresh()
    }
    
    @objc func goToDetails() {
        let detailVC = NotificationDetailVC()
        detailVC.modalPresentationStyle = .popover
        self.present(detailVC, animated: true, completion: nil)
        print("Se presiono cell")
    }
    
    func setNavBarLogo() {
        let image = UIImage(named: "logo_blanco")!.withTintColor(UIColor(named: "on_background")!, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        self.navigationItem.titleView = imageView
    }
    
    static func createDetails(labelText: String) -> NotificationsVC {
        let viewController = NotificationsVC()
        viewController.labelText = labelText
        return viewController
    }
    
    @objc func callPullToRefresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.notificationRepository.getNotification { result in
                switch result {
                case.success(let notification):
                    let notificationPresentation = notification.map { value in value.toPresentation() }
                    self.notificationsCollectionView.collectionNotification = notificationPresentation
                    self.notificationsCollectionView.reloadData()
                    
                case .failure(_):
                    print("Error")
                }
                
                self.notificationsCollectionView.reloadData()
                self.notificationsCollectionView.refreshControl?.endRefreshing()
            }
        }
    }
    
}


   
