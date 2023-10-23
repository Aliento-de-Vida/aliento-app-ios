//
//  DetailCampusVC.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 30/06/23.
//

import UIKit
import Resolver
import WebKit

class DetailCampusVC : UIViewController {
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
    
    @Injected var detailCampusRepository : CampusRepository
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let item = item else { return }
        
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
    <p><img src="https://scontent-mty2-1.xx.fbcdn.net/v/t39.30808-6/362288403_584157387255202_7804635306691895596_n.jpg?_nc_cat=107&amp;ccb=1-7&amp;_nc_sid=5614bc&amp;_nc_eui2=AeEEDRS3EO9lfI2NP9uA09Df0sOxxLrFPabSw7HEusU9pijlRqIc87iwXXzZEMJdLSzfOmGF0lbFVehtsttJxx_H&amp;_nc_ohc=-6Xl1N8FGjEAX_mkUl2&amp;_nc_ht=scontent-mty2-1.xx&amp;oh=00_AfCrX7kUPSKFYTwSrwNHFXIXs1DPocDc5zFOFzMxH_k3UQ&amp;oe=64FEB8BD" alt="" width="429" height="286" style="display: block; margin-left: auto; margin-right: auto;" /></p>
    <p></p>
    <p></p>
    <p></p>
    <p>&nbsp;</p>
    <p></p>
</body>
</html>
"""
