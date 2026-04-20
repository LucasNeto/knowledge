//
//  FlickrRepository.swift
//  knowledge
//
//  Created by Gui on 20/04/26.
//
import Foundation

class FlickrRepository {
    //completion > responsavel pelas interacoes, tinha esquecido
    func fetchPhotos(searchText: String?, completion: @escaping ([FlickrItem]) -> Void) {
        
        var urlString = "https://www.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1"
        
        if let searchText = searchText, !searchText.isEmpty {
            let encoded = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? searchText
            urlString += "&tags=\(encoded)"
        }
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Erro de rede: \(String(describing: error))")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let feed = try decoder.decode(FlickrFeed.self, from: data)
                completion(feed.items ?? [])  // entrega as fotos para quem chamou
            } catch {
                print("Erro no parse: \(error)")
            }
        }.resume()
    }
}
