//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by yoonyeosong on 2023/08/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var container : NSPersistentContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.container = appDelegate.persistentContainer
        
        let entity = NSEntityDescription.entity(forEntityName: "PhoneBook", in: self.container.viewContext)!
        
        let person = NSManagedObject(entity: entity, insertInto: self.container.viewContext)
        
        person.setValue("잘 저장 될까", forKey: "memo")
        person.setValue("Yeosong", forKey: "personName")
        person.setValue("010-0000-0000", forKeyPath: "phoneNumber")
        
        do {
            try self.container.viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
        
        fetchContact()
    }
    func fetchContact(){
        do {
            let contact = try self.container.viewContext.fetch(PhoneBook.fetchRequest()) as! [PhoneBook]
            contact.forEach{
                print($0.personName)
                print($0.phoneNumber)
                print($0.memo)
            }
        }catch {
            print(error.localizedDescription)
        }
    }


}

