//
//  Predicas.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 08/09/22.
//

import UIKit

class SermonsViewController: UIViewController {
    
    @IBOutlet weak var sermonsCollectionView: SermonsCollectionView!
    
    let collection = [
        Sermon(name: "predica 1", duration: 3000),
        Sermon(name: "predica 2", duration: 5000),
        Sermon(name: "predica 3", duration: 8000),
        Sermon(name: "predica 4", duration: 9000),
        Sermon(name: "predica 5", duration: 9000),
        Sermon(name: "predica 6", duration: 9000),
        Sermon(name: "predica 7", duration: 9000),
        Sermon(name: "predica 8", duration: 9000),
        Sermon(name: "predica 9", duration: 9000),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sermonsCollectionView.register(UINib(nibName: SermonItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: SermonItemCell.identifier)
        sermonsCollectionView.dataSource = sermonsCollectionView
        sermonsCollectionView.delegate = sermonsCollectionView
        sermonsCollectionView.collection = collection
        sermonsCollectionView.reloadData()
    }
}
