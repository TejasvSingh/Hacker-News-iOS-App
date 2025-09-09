//
//  ArticleListNewtworkManager.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 9/8/25.
//

import Foundation

protocol ArticleNetwork {
    func getData(from serverUrl: String, closure: @escaping (News?) -> Void)
}

class ArticleNetworkManager: ArticleNetwork {
    static let shared = ArticleNetworkManager()

    func getData(from serverUrl: String, closure: @escaping (News?) -> Void) {

        guard let serverURL = URL(string: serverUrl) else {
            print("Server URL is invalid")
            return
        }
        
       // fetch the data from the server
        let urlSession = URLSession.shared
        urlSession.dataTask(with: URLRequest(url: serverURL)) { data, response, error in
            
            // checking whether error fetchting the api
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            // wrapping the optional data to non optional
            guard let data = data else {
                print("No data returned from the server")
                return
            }
            
            // parsing the data to model
            do {
                let articleList = try JSONDecoder().decode(News.self, from: data)
                closure(articleList)
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }.resume()
    }
}
