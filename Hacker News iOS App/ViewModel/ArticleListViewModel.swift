//
//  ArticleListViewModel.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 9/8/25.
//
class ArticleListViewModel {
    var article: [ArticleList] = []
   var networkManager = ArticleNetworkManager.shared

   init() {
     
   }
   
   func getDataFromServer(closure: @escaping (() -> Void)) {
       networkManager.getData(from: Server.ArticlesEndPoint.rawValue) { [weak self] fetchedList in
               self?.article = fetchedList?.articles ?? []
               closure()
       }
   }
 
   func getArticlesCount() -> Int {
       return article.count
   }

   func getArticle(at index: Int) -> ArticleList {
       return article[index]
   }

   func getTitle(at index: Int) -> String {
       article[index].author ?? ""
   }
}
