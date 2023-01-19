//
//  Notifications.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 19/01/23.
//

import UIKit

class NotificationsVC : UIViewController {
    
    @IBOutlet weak var notificationsCollectionView:notificationsCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationsCollectionView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        notificationsCollectionView.register(UINib(nibName: NotificationsItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: NotificationsItemCell.identifier)
        notificationsCollectionView.dataSource = notificationsCollectionView
        notificationsCollectionView.delegate = notificationsCollectionView
        notificationsCollectionView.collectionNotification = collection
        notificationsCollectionView.reloadData()
        
        setNavBarLogo()
    }
    
    func setNavBarLogo() {
        let image = UIImage(named: "logo_blanco")!.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        self.navigationItem.titleView = imageView
    }
   
    let collection = [
        Notifications(imageUrl: "https://img.freepik.com/foto-gratis/foto-escala-grises-dos-hombres-rezando-juntos_181624-45295.jpg?w=1800&t=st=1674154108~exp=1674154708~hmac=8680c756c7fa54a74a6c4a4146aa7d76276eddae036200701f601d8ac7fe7cea", title: "Platicas", phrase: "Pastor Daniel, predicando la palabra", date: "19 ene 23"),
        Notifications(imageUrl: "https://img.freepik.com/foto-gratis/padres-sus-hijos-caminando-bosque_1303-16365.jpg?w=1800&t=st=1674155539~exp=1674156139~hmac=7e6081954573417fc01b11f4127b9dd6b6c7e7471733ecd7a85939b12c2a6b58", title: "FAMILIA", phrase: "¿Aprovechas a tu familia?", date: "20 ene 23"),
        Notifications(imageUrl: "https://img.freepik.com/foto-gratis/mujer-sentada-montana_1303-11174.jpg?w=1800&t=st=1674155773~exp=1674156373~hmac=315ad4530ef3975c8819eea407bf0aaad909e9927b75aab321201c5c3c9ea46f", title: "¿La soledad es mala?", phrase: "Descubrelo", date: "23 ene 23"),
        Notifications(imageUrl: "https://img.freepik.com/foto-gratis/mujer-concentrada-meditando-naturaleza_1098-1412.jpg?w=1800&t=st=1674155865~exp=1674156465~hmac=1e2d171b5cfa02ab7b90dce8ddc09a2d45c210387ad3fbb12a6147d37257a6b4", title: "BALANCE", phrase: "Encuentra el balance", date: "12 feb 23")
        ]
    
}
