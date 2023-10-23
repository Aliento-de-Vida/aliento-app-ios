//
//  GalleryDetailVC.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 28/06/23.
//

import UIKit
import Resolver
import WebKit

class GalleryDetailVC : UIViewController {
    var item : GalleryPresentation? = nil
    
    @IBOutlet var galleryDetailCollectionView: GalleryDetailCollectionView!
    @IBOutlet var titleDetailLabel: UILabel!
    
    @IBOutlet var WebViewGallery: WKWebView!
    @IBOutlet var heightWebView: NSLayoutConstraint!
    
    @IBOutlet var collectionViewHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let item = item else { return }
        
        titleDetailLabel.text = item.name
        
        galleryDetailCollectionView.register(UINib(nibName: GalleryDetailItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: GalleryDetailItemCell.identifier)
        galleryDetailCollectionView.dataSource = galleryDetailCollectionView
        galleryDetailCollectionView.delegate = galleryDetailCollectionView
        galleryDetailCollectionView.onClick = { item in
            let controller = FullScreenImageVC(imageUrl: item)
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: false, completion: nil)
        }
        galleryDetailCollectionView.galleryDetailCollectionView = item.images
        galleryDetailCollectionView.reloadData()
        
        let integersToCompleteNumber = 3 - (item.images.count % 3)
        collectionViewHeight.constant = Double(((item.images.count + integersToCompleteNumber) / 3)) * galleryDetailCollectionView.ITEM_HEIGHT
        
        webViewCampus()
    }
    
    @objc func goToGalleryDetails() {
        let galleryDetails = GalleryDetailVC()
        galleryDetails.modalPresentationStyle = .popover
        self.present(galleryDetails, animated: true, completion: nil)
    }
    
    func webViewCampus() {
        let webViewGallery = WebViewGallery
        webViewGallery?.navigationDelegate = self
        webViewGallery?.scrollView.isScrollEnabled = false
        webViewGallery!.loadHTMLString(html, baseURL: nil)
    }
    
    
    static func create(item : GalleryPresentation) -> GalleryDetailVC {
        let viewController = GalleryDetailVC()
        viewController.item = item
        return viewController
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        // guard let item = item else { return }
        //item.images.map { imageName in LightboxImage(imageURL: URL(string: imageName)!) }
      
    }
}

extension GalleryDetailVC: WKNavigationDelegate {
    func webView(_ webViewGallery: WKWebView, didFinish navigation: WKNavigation! ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.heightWebView.constant = webViewGallery.scrollView.contentSize.height
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
    <style>
    </style>
    <div>
        <h1>Online HTML Editor</h1>
        <img src="https://images.unsplash.com/photo-1691719603180-51fb706dcc62?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3087&q=80" style="max-width:100%;height:auto;" />
    
        <div>
            <h3>This is real time online HTML Edito</h3>
            <p>This is real time online HTML Edito</p>
        </div>
    </div>
</body>
</html>
"""
