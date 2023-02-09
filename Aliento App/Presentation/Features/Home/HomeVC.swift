//
//  Home.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 08/09/22.
//

import UIKit
import Resolver

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
    
    @Injected var homeRepository: HomeRepository
        
    var home: HomeModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        Task {
            do {
                home = try await homeRepository.getHome()
                let homeImages = try await homeRepository.getHomeImages()
                loadData(home: home!, homeImages: homeImages)
            } catch {
                //show(error)
                return
            }
        }

        carouselCollectionView.register(UINib(nibName: CarouselItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: CarouselItemCell.identifier)
        carouselCollectionView.dataSource = carouselCollectionView
        carouselCollectionView.delegate = carouselCollectionView
        carouselCollectionView.collectionCarousel = collectionCarousel
        carouselCollectionView.reloadData()
                
        cardOne.isUserInteractionEnabled = true
        cardOne.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cardOneClick)))
        cardOneShadow.addShadow()
        cardOne.roundCorners()

        cardTwoImage.isUserInteractionEnabled = true
        cardTwoImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cardTwoClick)))
        cardTwoShadow.addShadow()
        cardTwo.roundCorners()
        
        
        cardThreeImage.isUserInteractionEnabled = true
        cardThreeImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cardThreeClick)))
        cardThreeShadow.addShadow()
        cardThree.roundCorners()
        
        quickAccessOne.isUserInteractionEnabled = true
        quickAccessOne.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(quickAccessOneClick)))
        shadowQuickAccessOne.addShadow()
        cardQuickAccessOne.roundCorners()
        
        quickAccesTwo.isUserInteractionEnabled = true
        quickAccesTwo.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(quickAccessTwoClick)))
        shadowQuickAccessTwo.addShadow()
        cardQuickAccessTwo.roundCorners()

        quickAccesThree.isUserInteractionEnabled = true
        quickAccesThree.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(quickAccessThreeClick)))
        shadowQuickAccessThree.addShadow()
        cardQuickAccessThree.roundCorners()
        
        shadowSocialMedia.addShadow()
        cardSocialMedia.roundCorners()
        
        cardSocialMedia.backgroundColor = UIColor(named: "surface")!
        
        instagramIcon.image = UIImage(named: "ic_instagram")?.withTintColor(UIColor(named: "on_background")!)
        instagramIcon.isUserInteractionEnabled = true
        instagramIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(InstagramClick)))
        
        youtubeIcon.image = UIImage(named: "ic_youtube")?.withTintColor(UIColor(named: "on_background")!)
        youtubeIcon.isUserInteractionEnabled = true
        youtubeIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(YoutubeClick)))
        
        facebookIcon.image = UIImage(named: "ic_facebook-1")?.withTintColor(UIColor(named: "on_background")!)
        facebookIcon.isUserInteractionEnabled = true
        facebookIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FacebookClick)))
        
        twitterIcon.image = UIImage(named: "ic_twitter")?.withTintColor(UIColor(named: "on_background")!)
        twitterIcon.isUserInteractionEnabled = true
        twitterIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TwitterClick)))
        
        spotifyIcon.image = UIImage(named: "ic_spotify")?.withTintColor(UIColor(named: "on_background")!)
        spotifyIcon.isUserInteractionEnabled = true
        spotifyIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SpotifyClick)))
                
        setupNavBar()
    }
    
    func loadData(home: HomeModel, homeImages: HomeImages) {
        cardOneImage.load(url: homeImages.churchImage)
        cardTwoImage.load(url: homeImages.campusImage)
        cardThreeImage.load(url: homeImages.galleriesImage)
        
        quickAccessOne.load(url: homeImages.donationsImage)
        quickAccesTwo.load(url: homeImages.prayerImage)
        quickAccesThree.load(url: homeImages.ebookImage)
        
    }
    
    func setupNavBar() {
        self.navigationController?.navigationBar.tintColor = UIColor(named: "on_background")!

        setNavBarLogo()
        setupNavBarLefItem()
        setupNavBarRightItem()
    }
    
    func setNavBarLogo() {
        let image = UIImage(named: "logo_blanco")!.withTintColor(UIColor(named:"on_background")!, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        self.navigationItem.titleView = imageView
    }
    
    func setupNavBarLefItem() {
        let image = UIImage(systemName: "gearshape.fill")!
        
        let leftBarButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(goToSettings))
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    func setupNavBarRightItem() {
        let image = UIImage(systemName: "bell.fill")!
        
        let rightBarButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(goToNotifications))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @IBAction func goToPredicas(_ sender: Any) {
        navigationController?.pushViewController(TabBarController(), animated: true)
    } 
    
    @objc func goToSettings() {
        navigationController?.pushViewController(SettingsVC(), animated: true)
        print("Se presiono Go to Settings")
        
    }
    
    @objc func goToNotifications() {
        navigationController?.pushViewController(NotificationsVC(), animated: true)
        print("Se presiono Go to Notifications")
      
    }
    
    @objc func cardOneClick() {
        navigationController?.pushViewController(ChurchVC(), animated: true)
        print("Se presiono card one")
        // handling code
        
    }
    @objc func cardTwoClick() {
        navigationController?.pushViewController(CampusVC(), animated: true)
        print("Se presiono card two")
        // handling code
    }
    @objc func cardThreeClick() {
        navigationController?.pushViewController(GalleryVC(), animated: true)
        print("Se presiono card three")
        // handling code
    }
    
    @objc func quickAccessOneClick() {
        navigationController?.pushViewController(DonationsVC(), animated: true)
        print("Se presiono quick access one")
        // handling code
    }
    @objc func quickAccessTwoClick() {
        navigationController?.pushViewController(PlayerVC(), animated: true)
        print("Se presiono quick access two")
        // handling code
    }
    @objc func quickAccessThreeClick() {
        print("Se presiono quick access three")
        // handling code
    }
    @objc func InstagramClick() {
        guard let instagramClick = URL(string: home?.socialMedia.instagramUrl ?? "") else { return }
        UIApplication.shared.open(instagramClick)

        print("Se presiono instagram")
        // handling code
    }
    @objc func YoutubeClick() {
        print("Se presiono Youtube")
        guard let YoutubeClick = URL(string: home?.socialMedia.youtubeChannelUrl ?? "") else { return }
        UIApplication.shared.open(YoutubeClick)
        // handling code
    }
    @objc func FacebookClick() {
        print("Se presiono Facebook")
        guard let FacebookClick = URL(string: home?.socialMedia.facebookPageUrl ?? "") else { return }
        UIApplication.shared.open(FacebookClick)
        // handling code
    }
    @objc func TwitterClick() {
        print("Se presiono Twitter")
        guard let TwitterClick = URL(string: home?.socialMedia.twitterUrl ?? "") else { return }
        UIApplication.shared.open(TwitterClick)
        // handling code
    }
    @objc func SpotifyClick() {
        print("Se presiono Spotify")
        guard let SpotifyClick = URL(string: home?.socialMedia.spotifyArtistId ?? "") else { return }
        UIApplication.shared.open(SpotifyClick)
        // handling code
    }
   
    let collectionCarousel = [
        CarouselItem(imageUrl:"https://img.freepik.com/foto-gratis/gente-feliz-apilando-comunidad_1150-1689.jpg?w=2000&t=st=1673290399~exp=1673290999~hmac=ca9a255747e3908c907837f7aa1c13281665b26ccb21a5b5a4606b42874fa47d" , videoUrl: nil, menuName: nil),
        CarouselItem(imageUrl:"https://img.freepik.com/foto-gratis/silueta-ave-voladora-cielo-nublado_181624-5431.jpg?w=1800&t=st=1673545881~exp=1673546481~hmac=e66fa03c5c1cb7e24e873ecd79111de7df6e416acb2f0b801e0369d88e8b984e" , videoUrl: nil, menuName: nil),
        CarouselItem(imageUrl:"https://img.freepik.com/foto-gratis/mujer-disfruta-leyendo-libros_329181-19648.jpg?w=1800&t=st=1673546117~exp=1673546717~hmac=74d6d615e061bd01f49a0f62985c8d585519cd2487aac02ea88e6b9ea858ef9b" , videoUrl: nil, menuName: nil),
    ]
    
}
