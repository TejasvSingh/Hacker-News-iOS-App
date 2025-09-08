//
//  PostModel.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 9/5/25.
//

// PostModel.swift
import Foundation


struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

