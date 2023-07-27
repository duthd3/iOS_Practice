//
//  ViewController.swift
//  onlyCodeView
//
//  Created by yoonyeosong on 2023/07/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let Btn: UIButton = .init(frame: .init(x: 100, y: 100, width: 200, height: 200))
        Btn.backgroundColor = .yellow
        Btn.setTitle("바른생활 여송", for: .normal)
        
        self.view.addSubview(Btn)
        Btn.translatesAutoresizingMaskIntoConstraints = false // autolayout을 따르겠다.
        
        Btn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        Btn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
        Btn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -80).isActive = true
    }


}

