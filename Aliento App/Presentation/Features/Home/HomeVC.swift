//
//  Home.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 08/09/22.
//

import UIKit

class HomeVC: UIViewController {
        
    @IBOutlet weak var cardOneShadow: UIView!
    @IBOutlet weak var cardOneImage: UIImageView!
    @IBOutlet weak var cardOne: UIView!
    
    @IBOutlet weak var cardTwoShadow: UIView!
    @IBOutlet weak var cardTwoImage: UIImageView!
    @IBOutlet weak var cardTwo: UIView!
    
    @IBOutlet weak var cardThreeShadow: UIView!
    @IBOutlet weak var cardThreeImage: UIImageView!
    @IBOutlet weak var cardThree: UIView!
    
    @IBOutlet var quickAccessOne: UIImageView!
    @IBOutlet var shadowQuickAccessOne: UIView!
    @IBOutlet var cardQuickAccessOne: UIView!
    
    @IBOutlet var quickAccesTwo: UIImageView!
    @IBOutlet var shadowQuickAccessTwo: UIView!
    @IBOutlet var cardQuickAccessTwo: UIView!
    
    @IBOutlet var quickAccesThree: UIImageView!
    @IBOutlet var shadowQuickAccessThree: UIView!
    @IBOutlet var cardQuickAccessThree: UIView!
    
    @IBOutlet var shadowSocialMedia: UIView!
    @IBOutlet var cardSocialMedia: UIStackView!
    
    @IBOutlet var instagramIcon: UIImageView!
    @IBOutlet var youtubeIcon: UIImageView!
    @IBOutlet var facebookIcon: UIImageView!
    @IBOutlet var twitterIcon: UIImageView!
    @IBOutlet var spotifyIcon: UIImageView!
    
    @IBOutlet var carouselCollectionView: CarouselCollectionView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeRepository.getHome() { (result) in }

        carouselCollectionView.register(UINib(nibName: CarouselItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: CarouselItemCell.identifier)
        carouselCollectionView.dataSource = carouselCollectionView
        carouselCollectionView.delegate = carouselCollectionView
        carouselCollectionView.collectionCarousel = collectionCarousel
        carouselCollectionView.reloadData()
                
        cardOneImage.load(url: "https://concepto.de/wp-content/uploads/2015/03/paisaje-e1549600034372.jpg")
        cardOneImage.isUserInteractionEnabled = true
        cardOneImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cardOneClick)))
        
        cardOneShadow.addShadow()
        cardOne.roundCorners()

        cardTwoImage.load(url: "https://img.freepik.com/foto-gratis/silueta-mujer-manos-levantadas_1150-354.jpg?1&w=2000&t=st=1673280205~exp=1673280805~hmac=3d82da85635bea44b6c8f0461f5f4469256cb8c44b57f005a9e5019d0b676784")
        cardTwoShadow.addShadow()
        cardTwo.roundCorners()
        
        cardThreeImage.load(url: "https://img.freepik.com/foto-gratis/vida-cristiana-crisis-oracion-dios_1150-12938.jpg?w=2000&t=st=1673281128~exp=1673281728~hmac=74e2f4535cdc2418307aa3da83426170ac2d465622d161a977a38bdcdf1e18cf")
        cardThreeShadow.addShadow()
        cardThree.roundCorners()
        
        quickAccessOne.load(url:"https://img.freepik.com/foto-gratis/gente-feliz-apilando-comunidad_1150-1689.jpg?w=2000&t=st=1673290399~exp=1673290999~hmac=ca9a255747e3908c907837f7aa1c13281665b26ccb21a5b5a4606b42874fa47d")
        shadowQuickAccessOne.addShadow()
        quickAccessOne.roundCorners()
        
        quickAccesTwo.load(url: "https://img.freepik.com/foto-gratis/cantante-actuando-escenario-show-vivo-efecto-exposicion-doble-color_53876-104901.jpg?w=2000&t=st=1673365190~exp=1673365790~hmac=41b23af84513549405fa01261aca1b8cdf817cbc8ab98ba8e5346c772a794854")
        shadowQuickAccessTwo.addShadow()
        quickAccesTwo.roundCorners()

        quickAccesThree.load(url: "https://img.freepik.com/foto-gratis/vista-frontal-familia-sonriente-afuera_23-2149661362.jpg?w=1800&t=st=1673365559~exp=1673366159~hmac=2540a65b7dcb151d1ab0e69b99e44089d6cecb4ef183f912bbc3e9c07835da9c")
        shadowQuickAccessThree.addShadow()
        quickAccesThree.roundCorners()
        
        shadowSocialMedia.addShadow()
        cardSocialMedia.roundCorners()
        
        instagramIcon.image = UIImage(named: "ic_instagram")?.withTintColor(UIColor.black)
        
        youtubeIcon.image = UIImage(named: "ic_youtube")?.withTintColor(UIColor.black)
        
        facebookIcon.image = UIImage(named: "ic_facebook-1")?.withTintColor(UIColor.black)
        
        twitterIcon.image = UIImage(named: "ic_twitter")?.withTintColor(UIColor.black)
        
        spotifyIcon.image = UIImage(named: "ic_spotify")?.withTintColor(UIColor.black)
                
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
        navigationController?.pushViewController(TabBarController(), animated: true)
    } 
    
    @objc func goToSettings() {
        
    }
    
    @objc func cardOneClick() {
        print("Se presiono card one")
        // handling code
    }
    
    let collectionCarousel = [
        CarouselItem(imageUrl:"https://img.freepik.com/foto-gratis/gente-feliz-apilando-comunidad_1150-1689.jpg?w=2000&t=st=1673290399~exp=1673290999~hmac=ca9a255747e3908c907837f7aa1c13281665b26ccb21a5b5a4606b42874fa47d" , videoUrl: nil, menuName: nil),
        CarouselItem(imageUrl:"https://img.freepik.com/foto-gratis/silueta-ave-voladora-cielo-nublado_181624-5431.jpg?w=1800&t=st=1673545881~exp=1673546481~hmac=e66fa03c5c1cb7e24e873ecd79111de7df6e416acb2f0b801e0369d88e8b984e" , videoUrl: nil, menuName: nil),
        CarouselItem(imageUrl:"https://img.freepik.com/foto-gratis/mujer-disfruta-leyendo-libros_329181-19648.jpg?w=1800&t=st=1673546117~exp=1673546717~hmac=74d6d615e061bd01f49a0f62985c8d585519cd2487aac02ea88e6b9ea858ef9b" , videoUrl: nil, menuName: nil),
    ]
    
    
}

extension UIView {
    func dropShadow(
        shadowColor: UIColor = UIColor.black,
        fillColor: UIColor = UIColor.white,
        opacity: Float = 0.5,
        offset: CGSize = CGSize(width: 0.0, height: 1.0),
        radius: CGFloat = 10
    ) -> CAShapeLayer {
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: radius).cgPath
        shadowLayer.fillColor = fillColor.cgColor
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = offset
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowRadius = radius
        layer.insertSublayer(shadowLayer, at: 0)
        return shadowLayer
    }
}
