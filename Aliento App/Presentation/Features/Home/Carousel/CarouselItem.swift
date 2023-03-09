//
//  Carouselitem.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 11/01/23.
//

import Foundation

struct CarouselItem{
    let imageUrl: String
    let video: CarouselVideo?
    let menu: CarouselMenu?
}

struct CarouselVideo {
    let videoUrl :String
}

struct CarouselMenu {
    let menuName: String
}



