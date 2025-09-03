//
//  NewsModel.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 8/27/25.
//

struct Story {
    let title: String
    let points: Int
    let comments: Int
    let author: String
    let hoursAgo: Int
    
    static func getNewsList() -> [Story] {
        return [.init(title: "Show HN: Draw a fish and watch it swim with the others", points: 813, comments: 211, author: "halifax", hoursAgo: 6),
                .init(title: "At 17, Hannah Cairo solved a major math mystery", points: 742, comments: 98, author: "tanchel", hoursAgo: 12),
                .init(title: "Cerebras Code", points: 206, comments: 42, author: "clint", hoursAgo: 7),
                .init(title: "I couldn't submit a PR, so I got hired and fixed it myself", points: 389, comments: 126, author: "ayush", hoursAgo: 16),
                .init(title: "Google white-glove policy: tracking links unchecked, echo leaks preserved", points: 205, comments: 66, author: "nadi", hoursAgo: 20)]
    }
}



