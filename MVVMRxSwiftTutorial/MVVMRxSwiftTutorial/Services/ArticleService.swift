//
//  ArticleService.swift
//  MVVMRxSwiftTutorial
//
//  Created by yoonyeosong on 2023/10/17.
//

import Foundation
import Alamofire
import RxSwift

protocol ArticleServiceProtocol {
    func fetchNews() -> Observable<[Article]>
}

class stubArticleService: ArticleServiceProtocol {
    func fetchNews() -> Observable<[Article]> {
        return Observable.create { (observer) -> Disposable in
            
            Article(author: "yys", title: "asd", description: "asd", url: "asd", urlToImage: "asd", publishedAt: "qwe")
            Article(author: "yys", title: "asd", description: "asd", url: "asd", urlToImage: "asd", publishedAt: "qwe")
            Article(author: "yys", title: "asd", description: "asd", url: "asd", urlToImage: "asd", publishedAt: "qwe")
            Article(author: "yys", title: "asd", description: "asd", url: "asd", urlToImage: "asd", publishedAt: "qwe")
            Article(author: "yys", title: "asd", description: "asd", url: "asd", urlToImage: "asd", publishedAt: "qwe")
            Article(author: "yys", title: "asd", description: "asd", url: "asd", urlToImage: "asd", publishedAt: "qwe")
            
            return Disposables.create()
        }
    }
}

class ArticleService: ArticleServiceProtocol {
    
    func fetchNews() -> Observable<[Article]> {
        return Observable.create { (observer) -> Disposable in
            
            self.fetchNews { (error, articles) in
                if let error = error {
                    observer.onError(error)
                }
                if let articles = articles {
                    observer.onNext(articles)
                }
                observer.onCompleted()
            }
            
            return Disposables.create()
        }
    }
    
    private func fetchNews(completion: @escaping((Error?, [Article]?) -> Void)) {
        let urlString = "https://newsapi.org/v2/everything?q=apple&from=2023-10-16&to=2023-10-16&sortBy=popularity&apiKey=5fc11275464e4cc1949b76e3e8cd746f"
        
        guard let url = URL(string: urlString) else { return completion(NSError(domain: "yys", code: 404, userInfo: nil), nil)}
        
        AF.request(url, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseDecodable(of: ArticleResponse.self) { response in
            if let error = response.error {
                return completion(error, nil)
            }
            if let articles = response.value?.articles {
                return completion(nil, articles)
            }
        }
    }
}
