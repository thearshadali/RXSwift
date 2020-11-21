//
//  ViewController.swift
//  Hello_RxSwift
//
//  Created by Arshad Ali on 21/11/20.
//  Copyright © 2020 Arshad Ali. All rights reserved.
//

import UIKit
import RxSwift


enum RxError: Error {
    case someError
}

class ViewController: UIViewController {
    let disposebag = DisposeBag()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        example1()
        example2()
        example3()
    }
    
    func example1(){
        print("----- example 1 -------")
        
        let name = Observable.just("Arshad")
        name.subscribe(onNext: { (val) in
            print(val)
            }).disposed(by: disposebag)
    }
    
    
    func example2(){
        print("----- example 2 -------")
        
        Observable<String>.create { (observer) -> Disposable in
                 observer.onNext("1")
                 observer.onNext("2")
                 observer.onCompleted()
                 observer.onNext("3")  // will not print this value
                 observer.onError(RxError.someError)
            return Disposables.create()
        }.subscribe(onNext: { (el) in
            print(el)
        }, onError: { (err) in
            print(err.localizedDescription)
        }, onCompleted: {
            print("completed")
        }) {
            print("disposed")
        }.disposed(by: disposebag)
    }
    
    func example3(){
        print("----- example 3 -------")
      
        let pubSub =  PublishSubject<String>()
        
        pubSub.on(.next("new value")) // will not print this value
        
        pubSub.subscribe(onNext: {
               print($0) // publishSubject :- print latest value added after subscription
            }).disposed(by: disposebag)
        
        pubSub.onNext("new value 2") // print new value 2 since its added after subscription
    }
    
}

