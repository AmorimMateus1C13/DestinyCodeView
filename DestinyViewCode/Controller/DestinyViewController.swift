//
//  DestinyViewController.swift
//  DestinyViewCode
//
//  Created by Mateus Amorim on 15/08/22.
//


import UIKit
import SnapKit

class DestinyViewController: UIViewController {
    
    var storyView = StoryView()
//    var test = TestView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(storyView)
//        view.addSubview(test)
//        test.delegate = self
        makeConstrants()
        storyView.delegate = self
    }
    
    func makeConstrants() {
//        test.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
        storyView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension DestinyViewController: DidClickButton {
    func changeMan() {
        print("funcionou")
    }
}

