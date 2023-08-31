//
//  SampleNetworkViewController.swift
//  AlamofireTutorial
//
//  Created by yoonyeosong on 2023/08/31.
//

import UIKit

class SampleNetworkViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getButtonClicked(_ sender: Any) {
        GetPersonDataService.shared.getPersonInfo { (response) in
            switch(response) {
            case .success(let personData):
                if let data = personData as? Person {
                    self.nameLabel.text = data.name
                    self.messageLabel.text = data.profileMessage
                }
            case .requestErr(let message):
                print("requestErr", message)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
