//
//  APIFetchHandler.swift
//  AlamofireTutorial
//
//  Created by yoonyeosong on 2023/10/31.
//

import Foundation
import Alamofire

class APIFetchHandler {
    static let sharedInstance = APIFetchHandler()
    
    func postAPIData() {
        let url = "https://jsonplaceholder.typicode.com/posts"
        let params: Parameters = [
            "userID": 23,
            "title": "iOS Tutorials",
            "body": "sunt aut facere!!"
        ]
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                        print("Error converting data to JSON object")
                        return
                    }
                    guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                        print("Error converting JSON obeject to Pretty JSON data")
                        return
                    }
                    guard let prettyPritedJson = String(data: prettyJsonData, encoding: .utf8) else {
                        print("Error converting JSON data in String")
                        return
                    }
                    print(prettyPritedJson)
                }catch {
                    print("Error: Trying to convert JSON data to string")
                    return
                }
            case.failure(let error):
                print(error)
            }
        }
    }
    
    func fetchAPIData(handler: @escaping (_ apiData: [Model]) -> (Void)) {
        let url = "https://jsonplaceholder.typicode.com/posts"
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response{ response in
                switch response.result {
                case .success(let data):
                    do {
                        let jsonData = try JSONDecoder().decode([Model].self, from: data!)
                        handler(jsonData)
                    }catch {
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}


struct Model: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
