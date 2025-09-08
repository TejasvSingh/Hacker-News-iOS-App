import Foundation


struct NewsList: Codable {
    var hits: [Story]?
}

struct Story: Codable{
    let title: String
    let points: Int
    let comments: Int
    let author: String
    let hoursAgo: Int
    
    
    
    enum CodingKeys: String, CodingKey {
           case title = "title"              // API field: "title"
           case points = "points"            // API field: "points"
           case comments = "num_comments"    // API field: "num_comments"
           case author = "author"            // API field: "author"
           case hoursAgo = "created_at_i"    // API field: "created_at_i"
       }
}

