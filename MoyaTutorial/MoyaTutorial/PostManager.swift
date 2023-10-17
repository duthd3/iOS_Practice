//
//  PostManager.swift
//  MoyaTutorial
//
//  Created by yoonyeosong on 2023/09/04.
//

import Foundation
import Moya

class PostManager {
    private init() {}
    static let shared = PostManager()
    let provider = MoyaProvider<PostAPI>()
    
    func registerPost(post: PostRegister, completion: @escaping (Result<String, Error>) -> Void){
        provider.request(.postRegister(param: post)) { result in
            switch result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data.data, options: []) as? [String: Any]{
                    if let message = json["message"] as? String {
                        completion(.success(message))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
