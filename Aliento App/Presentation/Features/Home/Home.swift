//
//  Home.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 08/09/22.
//

import UIKit

class Home: UIViewController {
    
    @IBOutlet weak var cardOneImage: UIImageView!
    @IBOutlet weak var cardOne: UIView!
    
    @IBOutlet weak var cardTwoImage: UIImageView!
    @IBOutlet weak var cardTwo: UIView!
    
    @IBOutlet weak var cardThreeImage: UIImageView!
    @IBOutlet weak var cardThree: UIView!
    
    @IBOutlet var quickAccessOne: UIImageView!
    @IBOutlet var quickAccesTwo: UIImageView!
    @IBOutlet var quickAccesThree: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeRepository.getHome() { (result) in }
        
        cardOneImage.load(url: "https://concepto.de/wp-content/uploads/2015/03/paisaje-e1549600034372.jpg")
        cardOneImage.isUserInteractionEnabled = true
        cardOneImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cardOneClick)))
        cardOne.addShadow()

        cardTwoImage.load(url: "https://img.freepik.com/foto-gratis/silueta-mujer-manos-levantadas_1150-354.jpg?1&w=2000&t=st=1673280205~exp=1673280805~hmac=3d82da85635bea44b6c8f0461f5f4469256cb8c44b57f005a9e5019d0b676784")
        cardTwo.addShadow()
        
        cardThreeImage.load(url: "https://img.freepik.com/foto-gratis/vida-cristiana-crisis-oracion-dios_1150-12938.jpg?w=2000&t=st=1673281128~exp=1673281728~hmac=74e2f4535cdc2418307aa3da83426170ac2d465622d161a977a38bdcdf1e18cf")
        cardThree.addShadow()
        
        quickAccessOne.load(url:"https://img.freepik.com/foto-gratis/gente-feliz-apilando-comunidad_1150-1689.jpg?w=2000&t=st=1673290399~exp=1673290999~hmac=ca9a255747e3908c907837f7aa1c13281665b26ccb21a5b5a4606b42874fa47d")
        quickAccesTwo.load(url: "https://img.freepik.com/foto-gratis/cantante-actuando-escenario-show-vivo-efecto-exposicion-doble-color_53876-104901.jpg?w=2000&t=st=1673365190~exp=1673365790~hmac=41b23af84513549405fa01261aca1b8cdf817cbc8ab98ba8e5346c772a794854")
        quickAccesThree.load(url: "https://img.freepik.com/foto-gratis/vista-frontal-familia-sonriente-afuera_23-2149661362.jpg?w=1800&t=st=1673365559~exp=1673366159~hmac=2540a65b7dcb151d1ab0e69b99e44089d6cecb4ef183f912bbc3e9c07835da9c")
                
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
        navigationController?.pushViewController(VideoSermonsViewController(), animated: true)
    }
    
    @objc func goToSettings() {
        
    }
    
    @objc func cardOneClick() {
        print("Se presiono card one")
        // handling code
    }
    
}

                                      
