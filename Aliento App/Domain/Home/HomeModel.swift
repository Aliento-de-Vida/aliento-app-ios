//
//  HomeModel.swift
//  Aliento App
//
//  Created by Pedro Antonio on 17/01/23.
//

import Foundation

struct HomeModel {
    let ebook: String
    let youtubePlaylistId: String
    let youtubeChannelId: String
    let spotifyPlaylistId: String
    let prayerEmail: String
    let socialMedia: SocialMedia
}

struct SocialMedia {
    let instagramUrl: String
    let youtubeChannelUrl: String
    let facebookPageId: String
    let facebookPageUrl: String
    let twitterUserId: String
    let twitterUrl: String
    let spotifyArtistId: String
}
