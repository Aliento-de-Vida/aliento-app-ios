//
//  Home.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 08/09/22.
//

import UIKit
import Resolver

class HomeVC: UIViewController {
    var item : NotificationPresentation? = nil
        
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
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet var notificationView: UIView!
    @IBOutlet var notificationsCollectionView: NotificationsCollectionView!
    @IBOutlet var notificationViewHeight: NSLayoutConstraint!
    
    @Injected var homeRepository: HomeRepository
    @Injected var videoRepository: VideoRepository
    @Injected var notificationsRepository: NotificationRepository
    
        
    var home: HomeModel? = nil
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            cardOneImage.startShimmering()
            cardTwoImage.startShimmering()
            cardThreeImage.startShimmering()
            quickAccessOne.startShimmering()
            quickAccesTwo.startShimmering()
            quickAccesThree.startShimmering()
            
            do {
                home = try await homeRepository.getHome()
                let homeImages = try await homeRepository.getHomeImages()
                
                cardOneImage.stopShimmering()
                cardTwoImage.stopShimmering()
                cardThreeImage.stopShimmering()
                quickAccessOne.stopShimmering()
                quickAccesTwo.stopShimmering()
                quickAccesThree.stopShimmering()

                loadData(home: home!, homeImages: homeImages)
            } catch {
                //show(error)
                return
            }
        }
        
     
        
        // getVideos
        self.videoRepository.getVideo(playlistId: playlistId, maxResults: 5) { result in
            switch result {
            case.success(let videos):
                videos.prefix(3)
                    .forEach { video in
                    let item = CarouselItem(
                        imageUrl: video.thumbnulsUrl ?? "",
                        video: CarouselVideo(videoId: video.id),
                        menu: nil
                    )
                    self.collectionCarousel.append(item)
                }
                
                self.carouselCollectionView.collectionCarousel = self.collectionCarousel
                self.carouselCollectionView.reloadData()
                
                // pageControl
                self.pageControl.numberOfPages = self.collectionCarousel.count
                self.pageControl.currentPageIndicatorTintColor = UIColor(named: "on_background")?.withAlphaComponent(0.8)
                self.pageControl.pageIndicatorTintColor = UIColor(named: "on_background")?.withAlphaComponent(0.3)
                self.startTimer()
                
            case .failure(_):
                print("Error")
            }
        }
        
        
        
        // getNotifications
        
        notificationsRepository.getNotification { [self] result in
            switch result {
            case .success(let notifications):
                switch notifications.count{
                case 0 :
                    notificationViewHeight.constant = 0
                    notificationView.isHidden = true
                case 1 :
                    notificationViewHeight.constant = 45 + 216 //45 static, 216 one item
                    notificationView.isHidden = false
                default:
                    notificationViewHeight.constant = 45 + (2 * 216) //45 static, 216 * 2 two items
                    notificationView.isHidden = false
                }
                let notificationsPresentation = notifications.prefix(2).map { value in value.toPresentation() }
                self.notificationsCollectionView.collectionNotification = notificationsPresentation
                self.notificationsCollectionView.onClick = { [self] item in
                    let goToDetailsNotification = NotificationDetailVC.create(item: item)
                    goToDetailsNotification.modalPresentationStyle = .popover
                    self.present(goToDetailsNotification, animated: true, completion: nil)
                }
                self.notificationsCollectionView.reloadData()
                
            case .failure(_):
                print("Error")
            }
        }
        
        // add 3 Carousel Items with real videos
       
        carouselCollectionView.register(UINib(nibName: CarouselItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: CarouselItemCell.identifier)
        carouselCollectionView.dataSource = carouselCollectionView
        carouselCollectionView.delegate = carouselCollectionView
        carouselCollectionView.collectionCarousel = collectionCarousel
        carouselCollectionView.reloadData()
        carouselCollectionView.onClick = { item in
            if item.menu != nil {
                self.navigationController?.pushViewController(TabBarController(), animated: true)
            } else if item.video != nil {
                let viewController = PlayerYoutubeVC.create(videoId: item.video!.videoId)
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
        carouselCollectionView.onPageSelected = { currentPage in
            self.pageControl.currentPage = currentPage
        }
        
        notificationsCollectionView.register(UINib(nibName: NotificationsItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: NotificationsItemCell.identifier)
        notificationsCollectionView.dataSource = notificationsCollectionView
        notificationsCollectionView.delegate = notificationsCollectionView
                    
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
        cardOneImage.loadWithShimmering(url: homeImages.churchImage)
        cardTwoImage.loadWithShimmering(url: homeImages.campusImage)
        cardThreeImage.loadWithShimmering(url: homeImages.galleriesImage)
        
        quickAccessOne.loadWithShimmering(url: homeImages.donationsImage)
        quickAccesTwo.loadWithShimmering(url: homeImages.prayerImage)
        quickAccesThree.loadWithShimmering(url: homeImages.ebookImage)
        
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
    
    @objc func goToSettings() {
        navigationController?.pushViewController(SettingsVC(), animated: true)
        
    }
    
    @objc func goToNotifications() {
        navigationController?.pushViewController(NotificationsVC(), animated: true)
        print("Se presiono Go to Notifications")
      
    }
    
    @objc func cardOneClick() {
        let churchVC = ChurchVC()
        churchVC.modalPresentationStyle = .popover
        self.present(churchVC, animated: true, completion: nil)
        //navigationController?.pushViewController(ChurchVC(), animated: true)
        print("Se presiono card one")
        // handling code
        
    }
    @objc func cardTwoClick() {
        navigationController?.pushViewController(CampusVC(), animated: true)
        print("Se presiono card two")
        // handling code
    }
    @objc func cardThreeClick() {
        navigationController?.pushViewController(GalleryListVC(), animated: true)
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
        guard let home = home, let ebookUrl = URL(string: home.ebook) else { return }
        UIApplication.shared.open(ebookUrl)
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
        guard let SpotifyClick = URL(string: "spotify:artist:4VYxusCiKsWxcfUveymGU5") else { return }
        UIApplication.shared.open(SpotifyClick)
        // handling code
    }
   
    var collectionCarousel = [
    CarouselItem(
        // Case: Se muestra imagen y frase "Ver predicas"
        imageUrl: "https://img.freepik.com/foto-gratis/personas-alto-angulo-leyendo-juntas_23-2150062128.jpg?w=2000&t=st=1678305507~exp=1678306107~hmac=04e34c84934c945198053ae391bd4885dee49e0681b37aef0a7a81ae980bd358",
        video: nil,
        menu: CarouselMenu(menuName: "Ver prédicas")
    )
    ]
    
    func startTimer() {
        Timer.scheduledTimer(
            timeInterval: 3.0,
            target: self,
            selector: #selector(self.scrollToNextCell),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc func scrollToNextCell() {
        carouselCollectionView.scrollToNextCell()
    }
}
