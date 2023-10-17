//
//  ViewController.swift
//  MoyaPractice
//
//  Created by yoonyeosong on 2023/09/04.
//

import UIKit
import Moya
class ViewController: UIViewController {

    @IBOutlet weak var jokeTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let provider = MoyaProvider<JokeAPI>()
        provider.request(.randomJokes("GilDong", "Hong")){(result) in
            switch result {
            case let .success(response):
                let result = try? response.map(Joke.self)
                self.jokeTextView.text = result?.value.joke
            case let .failure(error):
                print(error.localizedDescription)
            }
        
        }
    }


}

