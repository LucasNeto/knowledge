//
//  FlickrItem.swift
//  knowledge
//
//  Created by Gui on 20/04/26.
//

import Foundation

struct FlickrItem: Codable {
    let title: String?
    let media: [String: String]?
    var imageURL: String? {
        return media?["m"]
    }
}
