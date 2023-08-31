//
//  NetworkResult.swift
//  AlamofireTutorial
//
//  Created by yoonyeosong on 2023/08/31.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
