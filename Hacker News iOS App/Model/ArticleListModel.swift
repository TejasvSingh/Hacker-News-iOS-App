//
//  ArticleListModel.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 9/8/25.
//

import Foundation

struct News: Decodable {
    let status: String
    let totalResults: Int
    let articles: [ArticleList]
}
struct ArticleList: Decodable {
    let author: String?
    let description: String?
    let urlToImage: String?
    let publishedAt: String
}
