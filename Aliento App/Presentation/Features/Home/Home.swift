//
//  Home.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 08/09/22.
//

import UIKit

class Home: UIViewController {
    
    @IBOutlet weak var cardOneImage: UIImageView!
    @IBOutlet weak var cardTwoImage: UIImageView!
    @IBOutlet weak var cardThreeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeRepository.getHome() { (result) in }
        
        cardOneImage.load("https://todoserver-peter.herokuapp.com/predicas.jpeg")
        
        setupNavBar()
    }
    
    func setupNavBar() {
        setNavBarLogo()
        setupNavBarLefItem()
    }
    
    func setNavBarLogo() {
        let image = UIImage(named: "logo_blanco")!.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        self.navigationItem.titleView = imageView
    }
    
    func setupNavBarLefItem() {
        let image = UIImage(systemName: "gearshape.fill")!.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        
        let leftBarButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(goToSettings))
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @IBAction func goToPredicas(_ sender: Any) {
        navigationController?.pushViewController(SermonsViewController(), animated: true)
    }
    
    @objc func goToSettings() {
        
    }

}
