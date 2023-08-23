//
//  PhoneBook+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by yoonyeosong on 2023/08/23.
//
//

import Foundation
import CoreData


extension PhoneBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhoneBook> {
        return NSFetchRequest<PhoneBook>(entityName: "PhoneBook")
    }

    @NSManaged public var phoneNumber: String?
    @NSManaged public var personName: String?
    @NSManaged public var memo: String?

}

extension PhoneBook : Identifiable {

}
