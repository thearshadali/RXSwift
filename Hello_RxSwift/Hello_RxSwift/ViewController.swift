//
//  ViewController.swift
//  Hello_RxSwift
//
//  Created by Arshad Ali on 21/11/20.
//  Copyright © 2020 Arshad Ali. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    let name = Observable.just("arshad")
    override func viewDidLoad() {
        super.viewDidLoad()
        name.subscribe(onNext: { (event) in
            print(event)
            }).disposed(by: DisposeBag())
    }
}

