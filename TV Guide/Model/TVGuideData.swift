//
//  TVShow.swift
//  TV Guide
//
//  Created by Oleh Haistruk on 12.08.2020.
//  Copyright © 2020 Oleh Haistruk. All rights reserved.
//

import Foundation

struct TVGuideData: Decodable {
    let items: [ShowItem]
    let itemsNumber: Int
    let total: Int
    let offset: Int
    let hasMore: Int
}

struct ShowItem: Decodable {
    let id: Int
    let name: String
    let iconURL: String
    var imageData: Data?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case iconURL = "icon"
        case imageData
    }
}
