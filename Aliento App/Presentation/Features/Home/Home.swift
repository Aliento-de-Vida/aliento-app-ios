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
    
    @IBOutlet var quickAccessOne: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeRepository.getHome() { (result) in }
        
        cardOneImage.load(url: "https://concepto.de/wp-content/uploads/2015/03/paisaje-e1549600034372.jpg")
        cardTwoImage.load(url: "https://img.freepik.com/foto-gratis/silueta-mujer-manos-levantadas_1150-354.jpg?1&w=2000&t=st=1673280205~exp=1673280805~hmac=3d82da85635bea44b6c8f0461f5f4469256cb8c44b57f005a9e5019d0b676784")
        cardThreeImage.load(url: "https://img.freepik.com/foto-gratis/vida-cristiana-crisis-oracion-dios_1150-12938.jpg?w=2000&t=st=1673281128~exp=1673281728~hmac=74e2f4535cdc2418307aa3da83426170ac2d465622d161a977a38bdcdf1e18cf")
        
        
        quickAccessOne.load(url:"https://img.freepik.com/foto-gratis/gente-feliz-apilando-comunidad_1150-1689.jpg?w=2000&t=st=1673290399~exp=1673290999~hmac=ca9a255747e3908c907837f7aa1c13281665b26ccb21a5b5a4606b42874fa47d")
                
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
