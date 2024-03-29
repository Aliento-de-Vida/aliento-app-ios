//
//  BottomNavigation.swift
//  Aliento App
//
//  Created by Pedro Antonio on 10/01/23.
//


import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNeedsStatusBarAppearanceUpdate()
                        
        let audioVc = AudioSermonsVC()
        let audioIcon = UITabBarItem(
            title: "Audio",
            image: UIImage(named: "ic_audio"),
            selectedImage: UIImage(named: "ic_audio")
        )
        audioVc.tabBarItem = audioIcon
        
        let videoVc = VideoSermonsVC()
        let videoIcon = UITabBarItem(
            title: "Video",
            image: UIImage(named: "ic_video"),
            selectedImage: UIImage(named: "ic_video")
        )
        videoVc.tabBarItem = videoIcon
        
        self.viewControllers = [audioVc, videoVc]
        self.selectedIndex = 0
        
        setupNavBar()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let customTabBarHeight: CGFloat = 90
        tabBar.frame.size.height = customTabBarHeight
        tabBar.frame.origin.y = view.frame.height - customTabBarHeight
    }
    
    func setupNavBar() {
        setNavBarLogo()
        setupNavBarLefItem()
    }
    
    func setNavBarLogo() {
        let image = UIImage(named: "logo_blanco")!.withTintColor(UIColor(named: "on_background")!, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        self.navigationItem.titleView = imageView
    }
    
    func setupNavBarLefItem() {
        let image = UIImage(systemName: "chevron.backward")!.withTintColor(UIColor(named:"on_background")!, renderingMode: .alwaysOriginal)
        
        let leftBarButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(goBack))
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
        
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
