//
//  Constants.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 9/5/25.
//

enum Server: String {
    case endPoint = "https://hn.algolia.com/api/v1/search?tags=front_page"
    case PostEndPoint = "https://jsonplaceholder.typicode.com/posts"
    case ArticlesEndPoint = "https://gist.githubusercontent.com/congsun/600f3ad57298f9dbc23fedf6b2b25450/raw/73d7a8ed589652339ae3646d0a595298ce5e72c2/newsFeed.json"
}

enum TableCellIdentifier: String {
    case listCell = "ListCell"
}

enum Screen {
    enum LoginView: String {
        case title = "Log in To Your Account!"
        case subtitles = "We're so glad to see you again. Log in to continue."
    }
}
