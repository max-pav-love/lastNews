//
//  NetworkManager.swift
//  lastNews
//
//  Created by Максим Хлесткин on 16.11.2021.
//

import Foundation

final class NetworkManager {
        
    private let newsURL = "https://inshortsapi.vercel.app/news?category=all"
    
    func fetchData(completion: @escaping (_ news: News) -> Void) {
        guard let url = URL(string: newsURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let news = try decoder.decode(News.self, from: data)
                completion(news)
            } catch let error {
                print("Error serialization json", error)
            }
        }.resume()
    }
}
