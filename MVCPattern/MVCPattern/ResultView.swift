//
//  ResultView.swift
//  MVCPattern
//
//  Created by yoonyeosong on 2023/07/27.
//

import UIKit

class ResultView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    func updateResultView(name: String, year: String){
        self.nameLabel?.text = name
        self.yearLabel?.text = year
    }
    
    
    
    
}
