//
//  FullScreenNotificationVC.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 03/07/23.
//

import UIKit
import Lightbox


class FullScreenNotificationVC : UIViewController {
    private let imageUrl: String
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable, renamed: "init(product:coder:)")
    required init(coder: NSCoder) {
        fatalError("Invalid way of decoding this class")
    }
    
    private var hasDisplayed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let images = [LightboxImage(imageURL: URL(string: imageUrl)!)]
        let controller = LightboxController(images: images)
        
        if hasDisplayed {
            dismiss(animated: false, completion: nil)
        } else {
            hasDisplayed = true
            controller.modalPresentationStyle = .fullScreen
            controller.dynamicBackground = true
            present(controller, animated: true)
        }
    }

}
