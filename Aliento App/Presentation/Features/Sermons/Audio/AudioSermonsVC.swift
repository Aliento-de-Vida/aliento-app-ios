//
//  Predicas.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 08/09/22.
//

import UIKit

class AudioSermonsVC: UIViewController {
    
    @IBOutlet var floatinActionButton: UIView!
    @IBOutlet weak var sermonsCollectionView: AudioSermonsCollectionView!
    
    let collection = [
        AudioSermon(name: "predica 1", duration: 3000, imageUrl: "https://img.freepik.com/foto-gratis/silueta-mujer-manos-levantadas_1150-354.jpg?1&w=2000&t=st=1673280205~exp=1673280805~hmac=3d82da85635bea44b6c8f0461f5f4469256cb8c44b57f005a9e5019d0b676784"),
        AudioSermon(name: "predica 2", duration: 5000, imageUrl: "https://img.freepik.com/foto-gratis/vida-cristiana-crisis-oracion-dios_1150-12938.jpg?w=2000&t=st=1673281128~exp=1673281728~hmac=74e2f4535cdc2418307aa3da83426170ac2d465622d161a977a38bdcdf1e18cf"),
        AudioSermon(name: "predica 3", duration: 8000, imageUrl: "https://img.freepik.com/foto-gratis/silueta-mujer-manos-levantadas_1150-354.jpg?1&w=2000&t=st=1673280205~exp=1673280805~hmac=3d82da85635bea44b6c8f0461f5f4469256cb8c44b57f005a9e5019d0b676784"),
        AudioSermon(name: "predica 4", duration: 9000, imageUrl: "https://img.freepik.com/foto-gratis/vida-cristiana-crisis-oracion-dios_1150-12938.jpg?w=2000&t=st=1673281128~exp=1673281728~hmac=74e2f4535cdc2418307aa3da83426170ac2d465622d161a977a38bdcdf1e18cf"),
        AudioSermon(name: "predica 5", duration: 9000, imageUrl: "https://img.freepik.com/foto-gratis/silueta-mujer-manos-levantadas_1150-354.jpg?1&w=2000&t=st=1673280205~exp=1673280805~hmac=3d82da85635bea44b6c8f0461f5f4469256cb8c44b57f005a9e5019d0b676784"),
        AudioSermon(name: "predica 6", duration: 9000, imageUrl: "https://img.freepik.com/foto-gratis/vida-cristiana-crisis-oracion-dios_1150-12938.jpg?w=2000&t=st=1673281128~exp=1673281728~hmac=74e2f4535cdc2418307aa3da83426170ac2d465622d161a977a38bdcdf1e18cf"),
        AudioSermon(name: "predica 7", duration: 9000, imageUrl: "https://img.freepik.com/foto-gratis/silueta-mujer-manos-levantadas_1150-354.jpg?1&w=2000&t=st=1673280205~exp=1673280805~hmac=3d82da85635bea44b6c8f0461f5f4469256cb8c44b57f005a9e5019d0b676784"),
        AudioSermon(name: "predica 8", duration: 9000, imageUrl: "https://img.freepik.com/foto-gratis/vida-cristiana-crisis-oracion-dios_1150-12938.jpg?w=2000&t=st=1673281128~exp=1673281728~hmac=74e2f4535cdc2418307aa3da83426170ac2d465622d161a977a38bdcdf1e18cf"),
        AudioSermon(name: "predica 9", duration: 9000, imageUrl: "https://img.freepik.com/foto-gratis/silueta-mujer-manos-levantadas_1150-354.jpg?1&w=2000&t=st=1673280205~exp=1673280805~hmac=3d82da85635bea44b6c8f0461f5f4469256cb8c44b57f005a9e5019d0b676784"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sermonsCollectionView.register(UINib(nibName: AudioSermonItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: AudioSermonItemCell.identifier)
        sermonsCollectionView.dataSource = sermonsCollectionView
        sermonsCollectionView.delegate = sermonsCollectionView
        sermonsCollectionView.collection = collection
        sermonsCollectionView.reloadData()
        
        floatinActionButton.layer.cornerRadius = floatinActionButton.layer.frame.width/2
        floatinActionButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
    }
    
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("spotify")
    }

}
