//
//  FModel.swift
//  knowledge
//
//  Created by Gui on 17/04/26.
//

import Foundation

struct FlickrFeed: Codable {
    let title: String
    let items: [FlickrItem]
}

struct FlickrItem: Codable {
    let title: String
    let media: [String: String]
    
    // O Flickr usa a chave "m" para o link da imagem dentro do dicionário "media"
    var imageURL: String? {
        return media["m"]
    }
}

