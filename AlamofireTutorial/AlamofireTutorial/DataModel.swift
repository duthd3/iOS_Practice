//
//  DataModel.swift
//  AlamofireTutorial
//
//  Created by yoonyeosong on 2023/08/31.
//

import Foundation

struct PersonDataModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: Person
}

struct Person: Codable {
    let name, profileMessage: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case profileMessage = "profile_message"
    }
}
