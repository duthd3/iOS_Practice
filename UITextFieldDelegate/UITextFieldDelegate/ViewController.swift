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
        textField.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
      //  enteredLabel.text = textField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        enteredLabel.text = textField.text
        return true
    }
    
}


