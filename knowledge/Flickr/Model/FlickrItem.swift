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

    
    // O Flickr usa a chave "m" para o link da imagem dentro do dicionário "media"
    var imageURL: String? {
        return media?["m"]
    }
}
