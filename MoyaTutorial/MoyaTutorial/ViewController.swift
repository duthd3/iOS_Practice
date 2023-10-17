//
//  ViewController.swift
//  MoyaTutorial
//
//  Created by yoonyeosong on 2023/09/04.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let postByUser = PostRegister(postTitle: "제목", categoryName: "카테고리", postMember: 2, tag1: "태그1", tag2: "태그2", tag3: "태그3", tag4: "", tag5: "", postContext: "내용")
        PostManager.shared.registerPost(post: postByUser) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
            
        }
    }


}

