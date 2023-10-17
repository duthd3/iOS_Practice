//
//  Post.swift
//  MoyaTutorial
//
//  Created by yoonyeosong on 2023/09/04.
//

import Foundation

struct PostRegister: Codable {
    let postTitle, categoryName: String
    let postMember: Int
    let tag1, tag2, tag3, tag4: String
    let tag5, postContext: String
}
