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
        sermonsCollectionView.onTap = { item in
            let bundleId = "com.alientodevida.app";
            let canonicalURL = item.spotify
            let branchLink = "https://spotify.link/content_linking?~campaign=\(bundleId)&$canonical_url=\(canonicalURL)"
            guard let url = URL(string: branchLink) else { return }
            UIApplication.shared.openURL(url)
        }
        
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
        floatinActionButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SpotifyClick)))
    }
    
    @objc func SpotifyClick() {
        print("Se presiono Youtube")
        guard let SpotifyClick = URL(string: "spotify:artist:4VYxusCiKsWxcfUveymGU5") else { return }
        UIApplication.shared.open(SpotifyClick)
        // handling code
    }
    
}

