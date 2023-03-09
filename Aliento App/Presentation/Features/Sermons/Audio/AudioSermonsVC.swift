//
//  Predicas.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 08/09/22.
//

import UIKit
import Resolver


class AudioSermonsVC: UIViewController {
    
    @IBOutlet var floatinActionButton: UIView!
    @IBOutlet weak var sermonsCollectionView: AudioSermonsCollectionView!
    @Injected var audioRepository : AudioRepository
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sermonsCollectionView.register(UINib(nibName: AudioSermonItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: AudioSermonItemCell.identifier)
        sermonsCollectionView.dataSource = sermonsCollectionView
        sermonsCollectionView.delegate = sermonsCollectionView
      
        audioRepository.getTracks(artistId: "4VYxusCiKsWxcfUveymGU5") { result in
            switch result {
            case.success(let tracks):
                let audiosPresentation = tracks.map { value in value.toPresentation() }
                self.sermonsCollectionView.collection = audiosPresentation
                self.sermonsCollectionView.reloadData()
                
            case .failure(let error):
                print("Error")
            }
        }
        
        floatinActionButton.layer.cornerRadius = floatinActionButton.layer.frame.width/2
        floatinActionButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
    }
    
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("spotify")
    }

}
