//
//  CampusVC.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 18/01/23.
//

import UIKit

class CampusVC : UIViewController {
    @IBOutlet var campusCollectionView: CampusCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        campusCollectionView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        campusCollectionView.register(UINib(nibName: CampusItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: CampusItemCell.identifier)
        campusCollectionView.dataSource = campusCollectionView
        campusCollectionView.delegate = campusCollectionView
        campusCollectionView.collectionCampus = collection
        campusCollectionView.reloadData()
        
        setNavBarLogo()
    }
    
    func setNavBarLogo() {
        let image = UIImage(named: "logo_blanco")!.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        self.navigationItem.titleView = imageView
    }
    
    let collection = [
        Campus(imageUrl: "https://img.freepik.com/foto-gratis/foto-escala-grises-dos-hombres-rezando-juntos_181624-45295.jpg?w=1800&t=st=1674154108~exp=1674154708~hmac=8680c756c7fa54a74a6c4a4146aa7d76276eddae036200701f601d8ac7fe7cea", title: "Honor", phrase: "Happy Place"),
        Campus(imageUrl: "https://img.freepik.com/foto-gratis/mujer-sentada-montana_1303-11174.jpg?w=1800&t=st=1674155773~exp=1674156373~hmac=315ad4530ef3975c8819eea407bf0aaad909e9927b75aab321201c5c3c9ea46f", title: "La vida", phrase: "Unica")]

}

