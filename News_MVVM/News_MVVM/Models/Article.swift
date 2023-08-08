//
//  Article.swift
//  News_MVVM
//
//  Created by yoonyeosong on 2023/08/08.
//

import Foundation

struct ArticleList: Decodable{
    let articles: [Article]
    
}

struct Article: Decodable{
    let title: String?
    let description: String?
}
