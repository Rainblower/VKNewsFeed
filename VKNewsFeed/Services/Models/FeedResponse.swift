//
//  FeedResponse.swift
//  VKNewsFeed
//
//  Created by WSR on 18/07/2019.
//  Copyright © 2019 Rainblower. All rights reserved.
//

import Foundation

struct FeedResponseWrapped:Decodable {
    let response: FeedResponse
}

struct FeedResponse: Decodable {
    var items: [FeedItem]
    var profiles: [Profiles]
    var groups: [Groups]
}

struct FeedItem: Decodable {
    let sourceId: Int
    let postId: Int
    let text: String?
    let date: Double
    let comments: CountableItem?
    let likes: CountableItem?
    let reposts: CountableItem?
    let views: CountableItem?
}

struct CountableItem: Decodable {
    let count: Int
}

protocol ProfileRepresentable {
    var id: Int { get }
    var name: String { get }
    var photo: String { get }
}

struct Profiles: Decodable, ProfileRepresentable {
    let id: Int
    let firstName: String
    let lastName: String
    let photo100: String
    
    var name: String { return firstName + " " + lastName }
    var photo: String { return photo100 }
}

struct Groups: Decodable, ProfileRepresentable {
    let id: Int
    let name: String
    let photo100: String
    
    var photo: String { return photo100 }
}
