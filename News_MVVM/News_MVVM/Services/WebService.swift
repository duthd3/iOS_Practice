//
//  WebService.swift
//  News_MVVM
//
//  Created by yoonyeosong on 2023/08/08.
//

import Foundation

class WebService{
    func getArticles(url: URL, completion:@escaping([Article]?) -> ()){
        URLSession.shared.dataTask(with: url){
            (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data{
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                print(articleList)
                if let articleList = articleList {
                    completion(articleList.articles)
                }
                print(articleList?.articles)
            }
        }.resume()
    }
}
