//
//  FlickrRepository.swift
//  knowledge
//
//  Created by Gui on 20/04/26.
//

import Foundation

class FlickrRepository {
    
    var urlString = "https://www.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1"
    var photos: [FlickrItem] = []

    //completion > responsavel pelas interacoes, tinha esquecido
    func fetchPhotos(searchText: String?, completion: @escaping ([FlickrItem]) -> Void) {
        if let searchText = searchText, !searchText.isEmpty {
            let encoded = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? searchText
            urlString += "&tags=\(encoded)"
        }
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let feed = try decoder.decode(FlickrFeed.self, from: data)
                self.photos = feed.items ?? []
                completion(self.photos)
            } catch {
            }
        }.resume()
    }
}
