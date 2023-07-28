//
//  ViewController.swift
//  labelAnimated
//
//  Created by yoonyeosong on 2023/07/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewEx: UIView!
    var label = UILabel()
    var btn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        viewEx.layer.borderWidth = 5
        viewEx.layer.borderColor = UIColor.red.cgColor
        self.view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 275).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 48).isActive = true
        btn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        btn.setTitle("ㅁㅁ", for: .normal)
        btn.backgroundColor = .orange
        
        UIView.animate(withDuration: 0.5, delay: 0, options:[.repeat, .autoreverse], animations: {
            self.viewEx.alpha = 0
        })
        
        
    }


}


