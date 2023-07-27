//
//  User Info View.swift
//  MVCPattern
//
//  Created by yoonyeosong on 2023/07/27.
//

import UIKit

protocol UpdateUserInfoDelegate: AnyObject{
    func updateUserInfo(firstName: String, lastName: String, age: String)
}

class User_Info_View: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    weak var delegate: UpdateUserInfoDelegate?
    
    
    @IBAction func didSelectResultButton(_ sender: Any) {
        guard let firstName = self.firstNameTextField?.text,
              let lastName = self.lastNameTextField?.text,
              let age = self.ageTextField?.text else { return }
        self.delegate?.updateUserInfo(firstName: firstName, lastName: lastName, age: age)
    }
    
    
    
    
    
    
}
