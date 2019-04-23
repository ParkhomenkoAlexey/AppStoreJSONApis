//
//  AppGroup.swift
//  AppStoreJSONApis
//
//  Created by Алексей Пархоменко on 21/04/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
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
    let artistName: String
    let artworkUrl100: String
    let name: String
    let id: String
}
