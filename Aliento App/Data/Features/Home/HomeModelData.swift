//
//  Home.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 16/09/22.
//

import Foundation

struct HomeModelData: Codable {
    let ebook: String
    let youtubePlaylistId: String
    let youtubeChannelId: String
    let spotifyPlaylistId: String
    let prayerEmail: String
    let socialMedia: SocialMediaData
}

struct SocialMediaData: Codable {
    let instagramUrl: String
    let youtubeChannelUrl: String
    let facebookPageId: String
    let facebookPageUrl: String
    let twitterUserId: String
    let twitterUrl: String
    let spotifyArtistId: String
}

extension HomeModelData {
    func toDomain() -> HomeModel {
        return HomeModel(
            ebook: self.ebook,
            youtubePlaylistId: self.youtubeChannelId,
            youtubeChannelId: self.youtubeChannelId,
            spotifyPlaylistId: self.spotifyPlaylistId,
            prayerEmail: self.prayerEmail,
            socialMedia: self.socialMedia.toDomain()
        )
    }
}

extension SocialMediaData {
    func toDomain() -> SocialMedia {
        return SocialMedia(
            instagramUrl: self.instagramUrl,
            youtubeChannelUrl: self.youtubeChannelUrl,
            facebookPageId: self.facebookPageId,
            facebookPageUrl: self.facebookPageUrl,
            twitterUserId: self.twitterUserId,
            twitterUrl: self.twitterUrl,
            spotifyArtistId: self.spotifyArtistId
        )
    }
}
