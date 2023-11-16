//
//  ViewController.swift
//  ReactorKitEx
//
//  Created by yoonyeosong on 2023/11/16.
//

import UIKit
import ReactorKit
import RxCocoa

class ViewController: UIViewController {

    //MARK: - Properties
    private lazy var appleButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("사과", for: UIControl.State.normal)
        return button
    }()
    
    private lazy var bananaButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("바나나", for: UIControl.State.normal)
        return button
    }()
    
    private lazy var grapesButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("포도", for: UIControl.State.normal)
        return button
    }()
    
    private lazy var selectedFruitLabel: UILabel = {
        let label = UILabel()
        label.text = "선택되어진 과일 없음"
        return label
    }()
    private lazy var stack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [appleButton, bananaButton, grapesButton, selectedFruitLabel])
        sv.axis = .vertical
        sv.spacing = 20
        return sv
    }()
    
    let disposeBag = DisposeBag()
    let fruitReactor = FruitReactor()
    
    //MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bind(reactor: fruitReactor)
    }
    //MARK: - Configures
    func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    //MARK: Bind Reactor
    func bind(reactor: FruitReactor){
        appleButton.rx.tap.map { FruitReactor.Action.apple }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        grapesButton.rx.tap.map { FruitReactor.Action.grapes }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        bananaButton.rx.tap.map { FruitReactor.Action.banana}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    
        reactor.state.map { $0.fruitName}
            .distinctUntilChanged()
            .map{ $0 }
            .subscribe(onNext: { val in
                self.selectedFruitLabel.text = val
            })
            .disposed(by: disposeBag)
        reactor.state.map { $0.isLoading }
            .distinctUntilChanged()
            .map { $0 }
            .subscribe(onNext: { val in
                if val == true {
                    self.selectedFruitLabel.text = "Loading..."
                }
            })
            .disposed(by: disposeBag)
    }
}

