//
//  VideoSermonsViewController.swift
//  Aliento App
//
//  Created by Pedro Antonio on 10/01/23.
//

import UIKit
import Resolver

class VideoSermonsVC: UIViewController {
    
    @IBOutlet weak var sermonsCollectionView: VideoSermonsCollectionView!
    @IBOutlet var floatinActionButton: UIView!
    @Injected var videoRepository : VideoRepository
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sermonsCollectionView.register(UINib(nibName: VideoSermonItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: VideoSermonItemCell.identifier)
        sermonsCollectionView.dataSource = sermonsCollectionView
        sermonsCollectionView.delegate = sermonsCollectionView
      
        videoRepository.getVideo(playlistId: "PLOPR9NDgPuLM8fP0Q_xvhaJ71IErDy21Y", maxResults: 50) { result in
            switch result {
            case.success(let videos):
                let videosPresentation = videos.map { value in value.toPresentation() }
                self.sermonsCollectionView.collectionVideo = videosPresentation
                self.sermonsCollectionView.reloadData()
                
            case .failure(let error):
                print("Error")
            }
        }
        
        floatinActionButton.layer.cornerRadius = floatinActionButton.layer.frame.width/2
        floatinActionButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc func handleTap() {
        print("youtube")
    }
    
   
}
