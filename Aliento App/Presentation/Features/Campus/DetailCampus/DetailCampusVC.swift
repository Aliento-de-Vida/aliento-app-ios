//
//  DetailCampusVC.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 30/06/23.
//

import UIKit
import Resolver

class DetailCampusVC : UIViewController {
    var item: CampusPresentation? = nil
    
    @IBOutlet var titleDetailsCampus: UILabel!
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var galleryDetails: UIButton!
    @IBOutlet var campusMaps: UIButton!
    @IBOutlet var campusImage: UIImageView!
    
    @Injected var detailCampusRepository : CampusRepository
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let item = item else { return }
        
        titleDetailsCampus.text = item.name
        label1.text = item.description
        label2.text = item.shortDescription
        label3.text = item.contact
        campusImage.image = nil
        campusImage.loadWithShimmering(url: item.imageUrl)
        campusImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        campusImage.isUserInteractionEnabled = true
        campusMaps.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(GoogleMapsClick)))
        
        
    }
   
    static func create(item : CampusPresentation) -> DetailCampusVC {
        let viewController = DetailCampusVC()
        viewController.item = item
        return viewController
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let item = item else { return }
        let controller = FullScreenImageVC(imageUrl: item.imageUrl)
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: false, completion: nil)
    }
    
    @objc func GoogleMapsClick() {
        guard let item = item else { return }
        
        if (UIApplication.shared.canOpenURL(NSURL(string:"https://maps.google.com")! as URL)) {
            UIApplication.shared.openURL(NSURL(string: "https://maps.google.com/?q=@\(item.location.latitude),\(item.location.longitude)")! as URL)
        }
    }
        
}
