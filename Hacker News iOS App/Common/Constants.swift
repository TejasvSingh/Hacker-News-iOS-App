//
//  Constants.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 9/5/25.
//

enum Server: String {
    case endPoint = "https://hn.algolia.com/api/v1/search?tags=front_page"
    case PostEndPoint = "https://jsonplaceholder.typicode.com/posts"
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
