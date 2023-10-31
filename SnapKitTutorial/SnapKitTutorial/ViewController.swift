//
//  ViewController.swift
//  SnapKitTutorial
//
//  Created by yoonyeosong on 2023/10/31.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemTeal
        
        self.view.addSubview(redView)
        self.view.addSubview(greenView)
        self.view.addSubview(blueView)
        self.view.addSubview(purpleView)
        
        redView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(200)
        }
        greenView.snp.makeConstraints { make in
            make.top.equalTo(redView.snp.bottom)
            make.leading.trailing.equalTo(redView)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        blueView.snp.makeConstraints { make in
            make.edges.equalTo(greenView).inset(UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50))
        }
        purpleView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.center.equalTo(blueView)
        }
    }
    
    


}

