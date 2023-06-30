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
        campusImage.load(url: item.imageUrl)
        
    }
   
    static func create(item : CampusPresentation) -> DetailCampusVC {
        let viewController = DetailCampusVC()
        viewController.item = item
        return viewController
    }
        
}
