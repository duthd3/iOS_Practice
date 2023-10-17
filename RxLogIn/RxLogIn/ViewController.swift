//
//  ViewController.swift
//  RxLogIn
//
//  Created by 픽셀로 on 2023/10/13.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController {
    private var timerDisposble: Disposable?
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var yysBtn: UIButton!
    
    
    
    @IBOutlet weak var emailCheckView: UIView!
    
    @IBOutlet weak var passwordCheckView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindUI()

        let observableJust = Observable<Date>.just(Date())
        DispatchQueue.main.asyncAfter(deadline: .now() + 60, execute: {
            observableJust.subscribe(onNext: { (data) in
                print(data)
            })
            
        })

       
        




        let observable = Observable<Int>.timer(.seconds(3),scheduler: MainScheduler.instance)
      
        observable.subscribe(onNext: {(data) in
                print(data)
        },
        onCompleted: {
            print("onComplete!")
            print("완료")
        },
        onDisposed: {
            print("onDispose!")
        })
        
        
        yysBtn.rx
            .tap
            .subscribe(onNext: {
                print("여송버튼")
            })
        let yysDisposable = yysBtn.rx
            .tap
            .subscribe(onNext: {
                print("여송버튼눌림")
            })
        yysBtn.rx
            .tap
            .subscribe(onNext: {
                yysDisposable.dispose()
                print("버튼구독해제")
            })
      
        
       
        
        
    }
    deinit {
        timerDisposble?.dispose()
    }
    private func checkId(_ email: String) -> Bool {
        let idRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let idTest = NSPredicate(format:"SELF MATCHES %@", idRegEx)
        return idTest.evaluate(with: email)
    }
    
    private func checkPassword(_ password: String) -> Bool {
        let pwRegEx = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,20}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pwRegEx)
        return predicate.evaluate(with: password)
        
    }
    private func bindUI() {
        emailTextField.rx.text.orEmpty
            .map(checkId)
            .subscribe(onNext: {s in
                if s {
                    self.emailCheckView.backgroundColor = UIColor.blue
                }else {
                    self.emailCheckView.backgroundColor = UIColor.yellow
                }
            })
        passwordTextField.rx.text.orEmpty
            .map(checkPassword)
            .subscribe(onNext: {s in
                if s {
                    self.passwordCheckView
                        .backgroundColor = UIColor.blue
                
                } else {
                    self.passwordCheckView
                        .backgroundColor =
                            UIColor.yellow
                }
            })
    }


}

