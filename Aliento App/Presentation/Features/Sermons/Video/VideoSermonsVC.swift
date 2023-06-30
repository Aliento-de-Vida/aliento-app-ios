//
//  VideoSermonsViewController.swift
//  Aliento App
//
//  Created by Pedro Antonio on 10/01/23.
//

import UIKit
import Resolver
import YouTubeiOSPlayerHelper

let playlistId = "PLOPR9NDgPuLM8fP0Q_xvhaJ71IErDy21Y"
var youtube: HomeModel? = nil


class VideoSermonsVC: UIViewController {
    
    @IBOutlet weak var sermonsCollectionView: VideoSermonsCollectionView!
    @IBOutlet var floatinActionButton: UIView!
    @Injected var videoRepository : VideoRepository
    
    var item: VideoModelPresentation? = nil
    var onTap : (VideoModelPresentation) -> Void = { _ in }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        sermonsCollectionView.register(UINib(nibName: VideoSermonItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: VideoSermonItemCell.identifier)
        sermonsCollectionView.dataSource = sermonsCollectionView
        sermonsCollectionView.delegate = sermonsCollectionView
        sermonsCollectionView.onTap = { item in
            let viewController = PlayerYoutubeVC.create(videoId: item.videoId)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        self.videoRepository.getVideo(playlistId: "PLOPR9NDgPuLM8fP0Q_xvhaJ71IErDy21Y", maxResults: 50) { result in
            switch result {
            case.success(let videos):
                let videosPresentation = videos.map { value in value.toPresentation() }
                self.sermonsCollectionView.collectionVideo = videosPresentation
                self.sermonsCollectionView.reloadData()
                
            case .failure(let error):
                print("Error")
            }
        }
        
        floatinActionButton.layer.cornerRadius = self.floatinActionButton.layer.frame.width/2
        floatinActionButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(YoutubeClick)))
    }
    
    
    /*  @objc func YoutubeClick() {
     print("Se presiono Youtube")
     var youtubeUrl = URL(string:"youtube://UC3C9WqYJUp3SVDr6yrzeZVg")!
     if UIApplication.shared.canOpenURL(youtubeUrl){
     UIApplication.shared.openURL(youtubeUrl)
     } else{
     youtubeUrl = URL(string:"https://www.youtube.com/@AlientoDeVidaTV")!
     UIApplication.shared.openURL(youtubeUrl)
     }
     }
     */
    @objc func YoutubeClick() {
        print("Se presiono Youtube")
        guard let YoutubeClick = URL(string: "https://www.youtube.com/c/AlientoDeVidaTV") else { return }
        UIApplication.shared.open(YoutubeClick)
        // handling code
    }
    
    
}
    
    

