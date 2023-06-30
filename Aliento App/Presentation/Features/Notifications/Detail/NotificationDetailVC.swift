//
//  DetailVC.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 23/06/23.
//

import UIKit
import Resolver

class NotificationDetailVC : UIViewController {
    var item: NotificationPresentation? = nil
    
    @IBOutlet var detailText: UILabel!
    @IBOutlet var ImageNotificationDetail: UIImageView!
    @IBOutlet var descriptionNotificationImage: UILabel!
    @IBOutlet var fullScreenNotification: UIButton!
    
    @Injected var detailRepository : NotificationRepository
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let item = item else { return }
        
        detailText.text = item.title
        ImageNotificationDetail.load(url: item.imageUrl)
        descriptionNotificationImage.text = item.phrase
        
    }
    
    static func create(item : NotificationPresentation) -> NotificationDetailVC {
        let viewController = NotificationDetailVC()
        viewController.item = item
        return viewController
    }
}
