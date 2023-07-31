//
//  UIImage.swift
//  Aliento App
//
//  Created by Pedro Antonio on 15/11/22.
//

import UIKit
import SDWebImage

extension UIImageView {
    func load(url: URL?, completion: @escaping () -> () = { }) {
        self.sd_setImage (with: url, placeholderImage: nil, options: [], completed: { (theImage, error, cache, url) in
            completion()
        })
    }
    
    func loadWithShimmering(
        url: String?,
        contentMode: ContentMode = UIView.ContentMode.scaleAspectFill
    ) {
        self.startShimmering()
        self.load(url: url, contentMode: contentMode) {
            self.stopShimmering()
        }
    }
    
    func load(
        url: String?,
        contentMode: ContentMode = UIView.ContentMode.scaleAspectFill,
        completion: @escaping () -> () = { }
    ) {
        self.contentMode = contentMode
        if let url = url, !url.isEmpty {
            self.sd_setImage (with: URL(string:url), placeholderImage: nil, options: [], completed: { (theImage, error, cache, url) in
                completion()
            })
        } else {
            self.image = nil
            completion()
        }
    }
}
