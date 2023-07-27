//
//  ViewController.swift
//  MVCPattern
//
//  Created by yoonyeosong on 2023/07/27.
//

import UIKit

class ViewController: UIViewController, UpdateUserInfoDelegate {
    
    
    @IBOutlet weak var resultView: ResultView!
    @IBOutlet weak var userInfoView: User_Info_View!
    
    let userInfoModel = UserInfoModel()
    
    func updateUserInfo(firstName: String, lastName: String, age: String) {
        let fullName = self.userInfoModel.fullName(firstName: firstName, lastName: lastName)
        let yearString = self.userInfoModel.yearOfBirth(ageString: age )
        self.resultView?.updateResultView(name: fullName, year: yearString)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.userInfoView?.delegate = self
        // Do any additional setup after loading the view.
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
