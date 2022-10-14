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
        guard let url = URL(string: "\(Constans.baseURL)/3/trending/movie/day?api_key=\(Constans.API_KEY)") else { return }
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
    
    func getTendringTvs(completion: @escaping (Result<[Tv], Error>) -> Void) {
        guard let url = URL(string: "\(Constans.baseURL)/3/trending/tv/day?api_key=\(Constans.API_KEY)") else { return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTvResponse.self, from: data)
                print(results)
            }catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constans.baseURL)/3/movie/upcoming?api_key=\(Constans.API_KEY)&language=en-US&page=1") else { return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print(results)
            }catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constans.baseURL)/3/movie/popular?api_key=\(Constans.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print(results)
            }catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getTopRated(completion: @escaping(Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constans.baseURL)/3/movie/top_rated?api_key=\(Constans.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print(results)
            }catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}


