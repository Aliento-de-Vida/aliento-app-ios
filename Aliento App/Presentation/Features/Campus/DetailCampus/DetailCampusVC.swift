//
//  DetailCampusVC.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 30/06/23.
//

import UIKit
import Resolver
import WebKit
import GoogleMaps

class DetailCampusVC : UIViewController, GMSMapViewDelegate {
    var item: CampusPresentation? = nil
    
    @IBOutlet var name: UILabel!
    @IBOutlet var shortDescription: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var contact: UILabel!
    @IBOutlet var galleryDetails: UIButton!
    @IBOutlet var campusMaps: UIButton!
    @IBOutlet var campusImage: UIImageView!
    @IBOutlet var webView: WKWebView!
    @IBOutlet var constraint_WebViewHeight: NSLayoutConstraint!
    @IBOutlet var mapContainer: GMSMapView!
    
    @Injected var detailCampusRepository : CampusRepository
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let item = item else { return }
        
        if let latitude = Double(item.location.latitude), let longitude = Double(item.location.longitude) {
            setGoogleMap(latitude: latitude, longitude: longitude)
        }
        
        name.text = item.name
        shortDescription.text = item.shortDescription
        //descriptionLabel.text = item.description
        //contact.text = item.contact
        campusImage.image = nil
        campusImage.loadWithShimmering(url: item.imageUrl)
        campusImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        campusImage.isUserInteractionEnabled = true
        campusMaps.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(GoogleMapsClick)))
        galleryDetails.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        galleryDetails.isUserInteractionEnabled = true
        webViewCampus()
        setNavBarLogo()
        currentlyLocation()
        
    }
   
    static func create(item : CampusPresentation) -> DetailCampusVC {
        let viewController = DetailCampusVC()
        viewController.item = item
        return viewController
    }
    
    func webViewCampus() {
        let webViewCampus = webView
        webViewCampus?.navigationDelegate = self
        webViewCampus?.scrollView.isScrollEnabled = false
        webViewCampus!.loadHTMLString(html, baseURL: nil)
    }
    
    func setGoogleMap(latitude: Double, longitude : Double) {
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 12.0)
        mapContainer.camera = camera
        mapContainer.settings.myLocationButton = true
        mapContainer.isMyLocationEnabled = true

        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.title = "Aliento de Vida"
        marker.snippet = "Cholul"
        marker.map = mapContainer
        self.mapContainer.animate(toLocation: marker.position)
    }
    
    func currentlyLocation() {
        var locationManager: CLLocationManager!
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 50
        locationManager.delegate = self
        locationManager.requestLocation()
    }
    
    func setNavBarLogo() {
        let image = UIImage(named: "logo_blanco")!.withTintColor(UIColor(named: "on_background")!, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        self.navigationItem.titleView = imageView
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let item = item else { return }
        let controller = FullScreenImageVC(imageUrl: item.imageUrl)
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: false, completion: nil)
    }
    
    @objc func GoogleMapsClick() {
        guard let item = item else { return }
        
        if (UIApplication.shared.canOpenURL(NSURL(string:"https://maps.google.com")! as URL)) {
            UIApplication.shared.openURL(NSURL(string: "https://maps.google.com/?q=@\(item.location.latitude),\(item.location.longitude)")! as URL)
        }
    }
    
}

extension DetailCampusVC: CLLocationManagerDelegate {
    func locationManager(_ locationManager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var preciseLocationZoomLevel: Float = 15.0
        var approximateLocationZoomLevel: Float = 10.0

        let location: CLLocation = locations.last!
        print("Location: \(location)")
        
        let zoomLevel = locationManager.accuracyAuthorization == CLAccuracyAuthorization.fullAccuracy ? preciseLocationZoomLevel : approximateLocationZoomLevel
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                                  longitude: location.coordinate.longitude,
                                                  zoom: zoomLevel)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        marker.title = "Me"
        marker.map = mapContainer

        mapContainer.animate(to: camera)
    }
    
    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // Check accuracy authorization
        let accuracy = manager.accuracyAuthorization
        switch accuracy {
        case .fullAccuracy:
            print("Location accuracy is precise.")
        case .reducedAccuracy:
            print("Location accuracy is not precise.")
        @unknown default:
            fatalError()
        }
        
        switch status {
           case .restricted:
             print("Location access was restricted.")
           case .denied:
             print("User denied access to location.")
             // Display the map using the default location.
           case .notDetermined:
             print("Location status not determined.")
           case .authorizedAlways: fallthrough
           case .authorizedWhenInUse:
             print("Location status is OK.")
           @unknown default:
             fatalError()
        }
    }
    
    // Handle location manager errors.
      func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error)")
      }
}

extension DetailCampusVC: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation! ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.constraint_WebViewHeight.constant = webView.scrollView.contentSize.height
        }
    }
}


private let html = """
<!DOCTYPE html>
<html>
<title>Online HTML Editor</title>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
  </script>
</head>
<body>
    <p></p>
    <h4><strong>&iexcl;Atenci&oacute;n comunidad de Aliento de Vida!</strong></h4>
    <p>Estamos emocionados de invitarte a nuestro hermoso campus en Cholul, un espacio donde podr&aacute;s encontrar inspiraci&oacute;n, aprendizaje y crecimiento personal. Queremos que seas parte de esta experiencia &uacute;nica que estamos preparando para ti.</p>
    <p><strong>Fecha de Apertura:</strong> El campus Cholul abrir&aacute; sus puertas, y estar&aacute; abierto de 9:00 am a 4:00 pm.</p>
    <p>En nuestro campus, encontrar&aacute;s una amplia gama de actividades y servicios que incluyen:</p>
    <ul>
    <li>
    <p><strong>Talleres y Seminarios:</strong> Ofrecemos una variedad de talleres y seminarios para enriquecer tus conocimientos y habilidades en diversas &aacute;reas, desde desarrollo personal hasta emprendimiento.</p>
    </li>
    <li>
    <p><strong>Biblioteca y &Aacute;reas de Estudio:</strong> Un espacio tranquilo y acogedor para estudiar, investigar y leer.</p>
    </li>
    <li>
    <p><strong>&Aacute;reas Verdes:</strong> Disfruta de nuestros hermosos jardines y &aacute;reas al aire libre para relajarte y conectarte con la naturaleza.</p>
    </li>
    <li>
    <p><strong>Cafeter&iacute;a:</strong> Un lugar perfecto para disfrutar de deliciosos alimentos y bebidas mientras conversas con amigos y colegas.</p>
    </li>
    <li>
    <p><strong>Asesoramiento y Orientaci&oacute;n:</strong> Nuestro equipo de expertos est&aacute; listo para ofrecerte asesoramiento y orientaci&oacute;n personalizada.</p>
    </li>
    </ul>
    <p>Para obtener m&aacute;s informaci&oacute;n sobre el campus Cholul, horarios de eventos, inscripciones y cualquier otra pregunta que puedas tener, no dudes en contactarnos:</p>
    <p ><strong>Correo:&nbsp;</strong>contactoalientodevida@gmail.com</p>
    <p><strong>Tel&eacute;fono:</strong>&nbsp;<span>+52 99 91 22 1961</span></p>
    <p>Estamos ansiosos por verte en el campus y ser parte de tu viaje hacia un mejor yo. &iexcl;&Uacute;nete a nosotros en esta emocionante aventura de aprendizaje y desarrollo personal!</p>
    <p>&iexcl;Te esperamos en el campus Cholul de Aliento de Vida!</p>
    <p></p>
    <p></p>
    <p>&nbsp;</p>
    <p></p>
</body>
</html>
"""


/*<p><img src="https://www.portumatrimonio.org/wp-content/uploads/2017/10/portu-happy-family-on-meadow-at-summer-sunset_bk66n7pho-1800x1100-768x469.jpgocDc5zFOFzMxH_k3UQ&amp;oe=64FEB8BD" alt="" width="429" height="286" style="display: block; margin-left: auto; margin-right: auto;" /></p>
*/
