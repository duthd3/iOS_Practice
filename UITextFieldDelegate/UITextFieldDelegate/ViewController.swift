//
//  ViewController.swift
//  UITextFieldDelegate
//
//  Created by yoonyeosong on 2023/07/28.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate { //채택작업

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var enteredLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self //viewController가 해당 UITextFieldDelegate의 메서드들을 이용할 수 있다.
       
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
       enteredLabel.text = textField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        enteredLabel.text = textField.text
        print("텍스트 필드의 리턴키가 눌러졌습니다.")
        return true
    }
    
    
    
}


