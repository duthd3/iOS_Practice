//
//  ViewController.swift
//  ReactorKitTutorial
//
//  Created by yoonyeosong on 2023/11/01.
//

import UIKit
import ReactorKit
import RxSwift
import RxCocoa



class ViewController: UIViewController,StoryboardView {

    var disposeBag: DisposeBag = DisposeBag()
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func bind(reactor: CounterViewReactor){
        //Action 바인딩
        increaseButton.rx.tap
            .map { Reactor.Action.increase}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
            
        decreaseButton.rx.tap
            .map {Reactor.Action.decrease}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
            
        
        //State 바인딩
        reactor.state
            .map { $0.value }
            .distinctUntilChanged()
            .map { "\($0)"}
            .bind(to: valueLabel.rx.text)
            .disposed(by: disposeBag)
    }


}

