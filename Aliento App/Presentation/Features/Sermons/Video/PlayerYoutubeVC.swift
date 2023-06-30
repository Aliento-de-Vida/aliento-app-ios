//
//  PlayerView.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 15/06/23.
//

import UIKit
import YouTubeiOSPlayerHelper
import Resolver


class PlayerYoutubeVC : UIViewController {
    // @Injected var videoRepository : VideoRepository
    
    var id : String? = nil
    @IBOutlet var playerView: YTPlayerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let videoId = self.id
        else {navigationController?.popViewController(animated: true)
            return
        }
        
        print(videoId)
        playerView.load(withVideoId: videoId)
        
    }
    
    static func create(videoId: String) -> PlayerYoutubeVC {
        let viewController = PlayerYoutubeVC()
        viewController.id = videoId
        return viewController
    }
}
