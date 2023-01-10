//
//  BottomNavigation.swift
//  Aliento App
//
//  Created by Pedro Antonio on 10/01/23.
//


import UIKit

class HomeBottomBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNeedsStatusBarAppearanceUpdate()
                        
        let audioVc = SermonsViewController()
        let audioIcon = UITabBarItem(
            title: "Audio",
            image: UIImage(named: "home.default.black"),
            selectedImage: UIImage(named: "home.default.black")
        )
        audioVc.tabBarItem = audioIcon
        
        let videoVc = VideoSermonsViewController()
        let videoIcon = UITabBarItem(
            title: "Video",
            image: UIImage(named: "explore.default.black"),
            selectedImage: UIImage(named: "explore.default.black")
        )
        videoVc.tabBarItem = videoIcon
        
        self.viewControllers = [audioVc, videoVc]
        self.selectedIndex = 0
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let customTabBarHeight: CGFloat = 90
        tabBar.frame.size.height = customTabBarHeight
        tabBar.frame.origin.y = view.frame.height - customTabBarHeight
    }
    
}

