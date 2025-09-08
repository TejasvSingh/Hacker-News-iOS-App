//
//  NetworkManager1.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 9/5/25.
//

import Foundation

protocol Network1 {
    func getData(from serverUrl: String, closure: @escaping ([Post]?) -> Void)
}

class NetworkManager1: Network1 {
    static let share = NetworkManager1()

    func getData(from serverUrl: String, closure: @escaping ([Post]?) -> Void) {

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
                let posts = try JSONDecoder().decode([Post].self, from: data)
                closure(posts)
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }.resume()
    }
}
