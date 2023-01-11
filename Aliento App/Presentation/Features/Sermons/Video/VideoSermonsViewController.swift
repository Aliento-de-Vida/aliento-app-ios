//
//  VideoSermonsViewController.swift
//  Aliento App
//
//  Created by Pedro Antonio on 10/01/23.
//

import UIKit

class VideoSermonsViewController: UIViewController {
    
    @IBOutlet weak var sermonsCollectionView: VideoSermonsCollectionView!
    @IBOutlet var floatinActionButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sermonsCollectionView.register(UINib(nibName: VideoSermonItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: VideoSermonItemCell.identifier)
        sermonsCollectionView.dataSource = sermonsCollectionView
        sermonsCollectionView.delegate = sermonsCollectionView
        sermonsCollectionView.collectionVideo = collection
        sermonsCollectionView.reloadData()
        
        floatinActionButton.layer.cornerRadius = floatinActionButton.layer.frame.width/2
        floatinActionButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
    }
    
    let collection = [
        SermonVideo(name: "DIOS QUIERE QUE VIVAS", phrase: "Se feliz, que al final del camino Dios le dara a cadá uno", imageUrl: "https://img.freepik.com/foto-gratis/silueta-mujer-manos-levantadas_1150-354.jpg?1&w=2000&t=st=1673280205~exp=1673280805~hmac=3d82da85635bea44b6c8f0461f5f4469256cb8c44b57f005a9e5019d0b676784", date: "26 noviembre 2021"),
        SermonVideo(name: "FAMILIAS URBANAS", phrase: "Se feliz, que al final del camino Dios le dara a cadá uno", imageUrl: "https://img.freepik.com/foto-gratis/vida-cristiana-crisis-oracion-dios_1150-12938.jpg?w=2000&t=st=1673281128~exp=1673281728~hmac=74e2f4535cdc2418307aa3da83426170ac2d465622d161a977a38bdcdf1e18cf", date: "26 noviembre 2021"),
        SermonVideo(name: "DISFRUTA DE LOS PEQUEÑOS DETALLES", phrase: "Se feliz, que al final del camino Dios le dara a cadá uno", imageUrl: "https://img.freepik.com/foto-gratis/silueta-mujer-manos-levantadas_1150-354.jpg?1&w=2000&t=st=1673280205~exp=1673280805~hmac=3d82da85635bea44b6c8f0461f5f4469256cb8c44b57f005a9e5019d0b676784", date: "26 noviembre 2021"),
        SermonVideo(name: "PEDRO PARA PRESIDENTE PASTORAL", phrase: "Se feliz, que al final del camino Dios le dara a cadá uno", imageUrl: "https://img.freepik.com/foto-gratis/vida-cristiana-crisis-oracion-dios_1150-12938.jpg?w=2000&t=st=1673281128~exp=1673281728~hmac=74e2f4535cdc2418307aa3da83426170ac2d465622d161a977a38bdcdf1e18cf", date: "26 noviembre 2021"),
        SermonVideo(name: "predica 5", phrase: "Se feliz, que al final del camino Dios le dara a cadá uno", imageUrl: "https://img.freepik.com/foto-gratis/silueta-mujer-manos-levantadas_1150-354.jpg?1&w=2000&t=st=1673280205~exp=1673280805~hmac=3d82da85635bea44b6c8f0461f5f4469256cb8c44b57f005a9e5019d0b676784", date: "26 noviembre 2021"),
        SermonVideo(name: "predica 6", phrase: "Se feliz, que al final del camino Dios le dara a cadá uno", imageUrl:  "https://img.freepik.com/foto-gratis/vida-cristiana-crisis-oracion-dios_1150-12938.jpg?w=2000&t=st=1673281128~exp=1673281728~hmac=74e2f4535cdc2418307aa3da83426170ac2d465622d161a977a38bdcdf1e18cf", date: "26 noviembre 2021"),
        SermonVideo(name: "predica 7", phrase: "Se feliz, que al final del camino Dios le dara a cadá uno", imageUrl: "https://img.freepik.com/foto-gratis/silueta-mujer-manos-levantadas_1150-354.jpg?1&w=2000&t=st=1673280205~exp=1673280805~hmac=3d82da85635bea44b6c8f0461f5f4469256cb8c44b57f005a9e5019d0b676784",date: "26 noviembre 2021"),
        SermonVideo(name: "predica 8", phrase: "Se feliz, que al final del camino Dios le dara a cadá uno", imageUrl: "https://img.freepik.com/foto-gratis/vida-cristiana-crisis-oracion-dios_1150-12938.jpg?w=2000&t=st=1673281128~exp=1673281728~hmac=74e2f4535cdc2418307aa3da83426170ac2d465622d161a977a38bdcdf1e18cf", date: "26 noviembre 2021"),
        SermonVideo(name: "predica 9", phrase: "Se feliz, que al final del camino Dios le dara a cadá uno", imageUrl: "https://img.freepik.com/foto-gratis/silueta-mujer-manos-levantadas_1150-354.jpg?1&w=2000&t=st=1673280205~exp=1673280805~hmac=3d82da85635bea44b6c8f0461f5f4469256cb8c44b57f005a9e5019d0b676784", date: "26 noviembre 2021"),
        
    
    ]
    
        
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("youtube")
        
    }

}
