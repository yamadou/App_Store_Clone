//
//  AppGroup.swift
//  AppStor
//
//  Created by Yamadou Traore on 5/25/19.
//  Copyright © 2019 yamadou. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id, name, artistName, artworkUrl100: String
}
