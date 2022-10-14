//
//  APICaller.swift
//  NetflixClone
//
//  Created by Jefferson Naranjo rodríguez on 14/10/22.
//

import Foundation

struct Constans {
    static let API_KEY = "469821b988270d2366e546a380e03332"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constans.baseURL)/3/trending/all/day?api_key=\(Constans.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
        do{
            let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
            completion(.success(results.results))
        }catch{
            completion(.failure(error))
        }
      }
        task.resume()
   }
}
