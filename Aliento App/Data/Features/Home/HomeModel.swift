//
//  Home.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 16/09/22.
//

import Foundation

struct HomeModel: Codable {
    let ebook: String
    let youtubePlaylistId: String
    let youtubeChannelId: String
    let spotifyPlaylistId: String
    let prayerEmail: String
//    let socialMedia: SocialMedia
}

//): Parcelable {
//  let isComplete: Boolean
//    get() = ebook.isNotBlank() &&
//        youtubePlaylistId.isNotBlank() &&
//        youtubeChannelId.isNotBlank() &&
//        spotifyPlaylistId.isNotBlank() &&
//        prayerEmail.isNotBlank() &&
//        socialMedia.isComplete
//
//  companion object {
//    fun empty() = Home(
//      ebook = "",
//      youtubePlaylistId = "",
//      youtubeChannelId = "",
//      spotifyPlaylistId = "",
//      prayerEmail = "",
//      socialMedia = SocialMedia(
//        instagramUrl = "",
//        youtubeChannelUrl = "",
//        facebookPageId = "",
//        facebookPageUrl = "",
//        twitterUserId = "",
//        twitterUrl = "",
//        spotifyArtistId = "",
//      ),
//    )
//  }
//}
//
//@Parcelize
//@Serializable
//data class SocialMedia(
//  let instagramUrl: String,
//  let youtubeChannelUrl: String,
//  let facebookPageId: String,
//  let facebookPageUrl: String,
//  let twitterUserId: String,
//  let twitterUrl: String,
//  let spotifyArtistId: String,
//): Parcelable {
//  let isComplete: Boolean
//    get() = instagramUrl.isNotBlank() &&
//        youtubeChannelUrl.isNotBlank() &&
//        facebookPageId.isNotBlank() &&
//        facebookPageUrl.isNotBlank() &&
//        twitterUserId.isNotBlank() &&
//        twitterUrl.isNotBlank() &&
//        spotifyArtistId.isNotBlank()
//}
