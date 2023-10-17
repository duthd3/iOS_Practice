//
//  Data.swift
//  MoyaTutorial
//
//  Created by yoonyeosong on 2023/09/04.
//

import Foundation
import Moya

enum APIService {
    case createUser(name: String)
    case readUsers
    case updateUser(id: Int, name: String)
    case deleteUser(id: Int)
    
}

extension APIService: TargetType {
    //end Point의 baseURL을 반환합니다.
    var baseURL: URL {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com") else {
            fatalError()
        }
        return url
    }
}
