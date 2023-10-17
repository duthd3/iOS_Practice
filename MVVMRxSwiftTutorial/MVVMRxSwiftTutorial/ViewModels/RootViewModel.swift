//
//  RootViewModel.swift
//  MVVMRxSwiftTutorial
//
//  Created by yoonyeosong on 2023/10/17.
//

import Foundation
import RxSwift

final class RootViewModel {
    let title = "YYS News"
    
    private let articleService: ArticleServiceProtocol
    
    init(articleService: ArticleServiceProtocol) {
        self.articleService = articleService
    }
    
    func fetchArticles() -> Observable<[ArticleViewModel]> {
        articleService.fetchNews().map { $0.map { ArticleViewModel(article:$0) } }
        
    }
}
