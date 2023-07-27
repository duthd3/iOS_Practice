//
//  UserInfoModel.swift
//  MVCPattern
//
//  Created by yoonyeosong on 2023/07/27.
//

import Foundation

class UserInfoModel{
    func fullName(firstName: String, lastName: String) -> String {
        return "\(firstName) \(lastName)"
    }
    
    func yearOfBirth(ageString: String) -> String{
        let calendar = Calendar.current
        let year = calendar.component(.year, from: Date())
        
        let age = Int(ageString) ?? 0
        let birthYear = year - age
        
        return String(birthYear)
    }
}
