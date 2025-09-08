import Foundation

protocol NewsListViewModelProtocol {
    func getStoryCount() -> Int
    func getStory(at index: Int) -> Story
    func getTitle(at index: Int) -> String
    func getMeta(at index: Int) -> String
}

class NewsListViewModel: NewsListViewModelProtocol {

    
     var stories: [Story] = []
    var networkManager = NetworkManager.shared

    init() {
      //  loadNews()
    }
    
    func getDataFromServer(closure: @escaping (() -> Void)) {
        networkManager.getData(from: Server.endPoint.rawValue) { [weak self] fetchedList in
                self?.stories = fetchedList?.hits ?? []
                closure()
        }
    }
  
    func getStoryCount() -> Int {
        return stories.count
    }

    func getStory(at index: Int) -> Story {
        return stories[index]
    }

    func getTitle(at index: Int) -> String {
        stories[index].title
    }

    func getMeta(at index: Int) -> String {
        let s = stories[index]
        return "\(s.author) · \(s.hoursAgo)h ago"
    }

    
//    func loadNews() {
//        stories = [
//            .init(title: "Show HN: Draw a fish and watch it swim with the others",
//                  points: 813, comments: 211, author: "halifax", hoursAgo: 6),
//            .init(title: "At 17, Hannah Cairo solved a major math mystery",
//                  points: 742, comments: 98, author: "tanchel", hoursAgo: 12),
//            .init(title: "Cerebras Code",
//                  points: 206, comments: 42, author: "clint", hoursAgo: 7),
//            .init(title: "I couldn't submit a PR, so I got hired and fixed it myself",
//                  points: 389, comments: 126, author: "ayush", hoursAgo: 16),
//            .init(title: "Google white-glove policy: tracking links unchecked, echo leaks preserved",
//                  points: 205, comments: 66, author: "nadi", hoursAgo: 20)
//        ]
//    }
}
