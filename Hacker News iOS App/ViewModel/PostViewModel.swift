//
//  PostViewModel.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 9/5/25.
//

import Foundation

class PostViewModel {
    var posts: [Post] = []
    let network_Manager = NetworkManager1.share
    func getDataFromServer(closure: @escaping (() -> Void)) {
          network_Manager.getData(from: Server.PostEndPoint.rawValue) { [weak self] fetched_Posts in
              self?.posts = fetched_Posts!
              closure()
          }
      }

    func post(at index: Int) -> Post {
        return posts[index]
    }

    func count() -> Int {
        return posts.count
    }
}
