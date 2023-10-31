//
//  ViewController.swift
//  AlamofireTutorial
//
//  Created by yoonyeosong on 2023/10/31.
//

import UIKit

class ViewController: UIViewController {

    var apiResult = [Model]()
    
    
    
    @IBOutlet weak var apiDataView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        APIFetchHandler.sharedInstance.fetchAPIData{ apiData in
            self.apiResult = apiData
            
            DispatchQueue.main.async {
                self.apiDataView.reloadData()
            }
        }
        APIFetchHandler.sharedInstance.postAPIData()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiResult.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellProto")
        else {
            return UITableViewCell()
        }
        cell.textLabel?.text = apiResult[indexPath.row].title
        return cell
    }
}
