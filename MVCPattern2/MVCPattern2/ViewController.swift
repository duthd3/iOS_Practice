//
//  ViewController.swift
//  MVCPattern2
//
//  Created by yoonyeosong on 2023/07/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwdTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var message: UILabel!
    var user: User!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        message.isHidden = true
    }

    @IBAction func didPressLogin(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwdTextField.text else { return }
        user = User(email: email, password: password)
        
        // email = test@gmail.com & password = 1234라고 가정
        if user.email == "test@gmail.com" && user.password == "1234"{
            message.text = "로그인 성공"
            message.isHidden = false
        }
    }
    
}

