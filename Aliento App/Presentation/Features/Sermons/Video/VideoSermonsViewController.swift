//
//  VideoSermonsViewController.swift
//  Aliento App
//
//  Created by Pedro Antonio on 10/01/23.
//

import UIKit

class VideoSermonsViewController: UIViewController {
    
    @IBOutlet weak var sermonsCollectionView: VideoSermonsCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sermonsCollectionView.register(UINib(nibName: VideoSermonItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: VideoSermonItemCell.identifier)
        sermonsCollectionView.dataSource = sermonsCollectionView
        sermonsCollectionView.delegate = sermonsCollectionView
        sermonsCollectionView.collection = collection
        sermonsCollectionView.reloadData()
    }
    
    let collection = [
        Sermon(name: "predica 1", duration: 3000, imageUrl: "https://img.freepik.com/foto-gratis/silueta-mujer-manos-levantadas_1150-354.jpg?1&w=2000&t=st=1673280205~exp=1673280805~hmac=3d82da85635bea44b6c8f0461f5f4469256cb8c44b57f005a9e5019d0b676784"),
        Sermon(name: "predica 2", duration: 5000, imageUrl: "https://img.freepik.com/foto-gratis/vida-cristiana-crisis-oracion-dios_1150-12938.jpg?w=2000&t=st=1673281128~exp=1673281728~hmac=74e2f4535cdc2418307aa3da83426170ac2d465622d161a977a38bdcdf1e18cf"),
        Sermon(name: "predica 3", duration: 8000, imageUrl: "https://img.freepik.com/foto-gratis/silueta-mujer-manos-levantadas_1150-354.jpg?1&w=2000&t=st=1673280205~exp=1673280805~hmac=3d82da85635bea44b6c8f0461f5f4469256cb8c44b57f005a9e5019d0b676784"),
        Sermon(name: "predica 4", duration: 9000, imageUrl: "https://img.freepik.com/foto-gratis/vida-cristiana-crisis-oracion-dios_1150-12938.jpg?w=2000&t=st=1673281128~exp=1673281728~hmac=74e2f4535cdc2418307aa3da83426170ac2d465622d161a977a38bdcdf1e18cf"),
        Sermon(name: "predica 5", duration: 9000, imageUrl: "https://img.freepik.com/foto-gratis/silueta-mujer-manos-levantadas_1150-354.jpg?1&w=2000&t=st=1673280205~exp=1673280805~hmac=3d82da85635bea44b6c8f0461f5f4469256cb8c44b57f005a9e5019d0b676784"),
        Sermon(name: "predica 6", duration: 9000, imageUrl: "https://img.freepik.com/foto-gratis/vida-cristiana-crisis-oracion-dios_1150-12938.jpg?w=2000&t=st=1673281128~exp=1673281728~hmac=74e2f4535cdc2418307aa3da83426170ac2d465622d161a977a38bdcdf1e18cf"),
        Sermon(name: "predica 7", duration: 9000, imageUrl: "https://img.freepik.com/foto-gratis/silueta-mujer-manos-levantadas_1150-354.jpg?1&w=2000&t=st=1673280205~exp=1673280805~hmac=3d82da85635bea44b6c8f0461f5f4469256cb8c44b57f005a9e5019d0b676784"),
        Sermon(name: "predica 8", duration: 9000, imageUrl: "https://img.freepik.com/foto-gratis/vida-cristiana-crisis-oracion-dios_1150-12938.jpg?w=2000&t=st=1673281128~exp=1673281728~hmac=74e2f4535cdc2418307aa3da83426170ac2d465622d161a977a38bdcdf1e18cf"),
        Sermon(name: "predica 9", duration: 9000, imageUrl: "https://img.freepik.com/foto-gratis/silueta-mujer-manos-levantadas_1150-354.jpg?1&w=2000&t=st=1673280205~exp=1673280805~hmac=3d82da85635bea44b6c8f0461f5f4469256cb8c44b57f005a9e5019d0b676784"),
    ]

    
}
