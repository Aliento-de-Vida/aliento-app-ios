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
    
    @IBOutlet var emptyState: UIView!
    @IBOutlet var emptyStateMessage: UILabel!
    @IBOutlet var emptyStateImage: UIImageView!
    @IBOutlet var contentNotifications: UIView!
    @IBOutlet var emptyStateScroll: UIScrollView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    @Injected var notificationRepository: NotificationRepository
    var onClick: (NotificationPresentation) -> Void = { item in }
    
    var labelText : String? = nil
    
    var notificationsRefreshControl = UIRefreshControl()
    var emptyStateRefreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emptyStateScroll.isHidden = true
        contentNotifications.isHidden = true

        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        updateNotifications()

        notificationsCollectionView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        notificationsCollectionView.register(UINib(nibName: NotificationsItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: NotificationsItemCell.identifier)
        notificationsCollectionView.dataSource = notificationsCollectionView
        notificationsCollectionView.delegate = notificationsCollectionView
        notificationsCollectionView.onClick = { [self] item in
            let goToDetailsNotification = NotificationDetailVC.create(item: item)
            goToDetailsNotification.modalPresentationStyle = .popover
            self.present(goToDetailsNotification, animated: true, completion: nil)
        }
        
       
        notificationRepository.getNotification { [self] result in
            switch result {
            case .success(let notifications):
                let notificationsPresentation = notifications.map { value in value.toPresentation() }
                self.notificationsCollectionView.collectionNotification = notificationsPresentation
                self.notificationsCollectionView.reloadData()
                
            case .failure(_):
                print("Error")
            }
        }
   
        configureRefreshControl()
        setNavBarLogo()
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
    
    private func setCollectionViewState(notifications: [NotificationPresentation]) {
        contentNotifications.isHidden = false
        emptyStateScroll.isHidden = true
        
        self.notificationsCollectionView.collectionNotification = notifications
        self.notificationsCollectionView.reloadData()
    }
    
   private func setEmptyState(imageName: String , errorDescription: String ) {
        contentNotifications.isHidden = true
        emptyStateScroll.isHidden = false
        
        emptyStateImage.image = UIImage(named: imageName)
        emptyStateMessage.text = errorDescription
    }
    
    func configureRefreshControl() {
        notificationsCollectionView.refreshControl = notificationsRefreshControl
        notificationsCollectionView.refreshControl?.addTarget(self, action: #selector(refreshNotifications), for: .valueChanged)
        emptyStateScroll.refreshControl = emptyStateRefreshControl
        emptyStateScroll.refreshControl?.addTarget(self, action: #selector(refreshNotifications), for: .valueChanged)
    }
   
    @objc func refreshNotifications() {
        self.notificationsRefreshControl.beginRefreshing()
        self.emptyStateRefreshControl.beginRefreshing()

        updateNotifications()
    }
    
    func updateNotifications() {
            self.notificationRepository.getNotification { result in
                self.hideIndicators()
               
                switch result {
                case.success(let notification):
                    let notificationPresentation = notification.map { value in value.toPresentation() }
                    
                    if (notificationPresentation.isEmpty) {
                        self.setEmptyState(imageName: "Empty State", errorDescription: "No hay notificaciones en este momento")
                    } else {
                        self.setCollectionViewState(notifications : notificationPresentation)
                    }
    
                case .failure(_):
                    self.setEmptyState(imageName: "Empty State", errorDescription: "Algo salio mal, vuelve a intertarlo mas tarde")
                    print("Error")
                }
            }
        
    }
    
    func hideIndicators() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        notificationsRefreshControl.endRefreshing()
        emptyStateRefreshControl.endRefreshing()
    }
    
}


   
