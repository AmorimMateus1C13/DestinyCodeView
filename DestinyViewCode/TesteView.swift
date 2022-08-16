//
//  testeView.swift
//  outroTest
//
//  Created by Mateus Amorim on 16/08/22.
//

import Foundation
import UIKit
import SnapKit

protocol numbersProtocol {
    func numberChange()
}

class TestView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var delegate: numbersProtocol?
    
    
    var imageBack: UIImageView = {
        let background = UIImageView()
        let bundle = Bundle(for: StoryView.self)
        if let image = UIImage(named: Constants.Bground.background, in: bundle, compatibleWith: nil){
            background.image = image
        }
        return background
    }()
    
    var button2: UIButton = {
       let button = buttonConfiguration()
        button.imageButton(with: Constants.Bground.choice2Bg)
//       button.setTitle("button2", for: .normal)
       button.addTarget(self, action: #selector(numberChange), for: .touchUpInside)
       return button
   }()
    
     var button: UIButton = {
        let button = buttonConfiguration()
         button.backgroundColor = .red
        button.setTitle("button", for: .normal)
        button.addTarget(self, action: #selector(numberChange), for: .touchUpInside)
        return button
    }()
    
    @objc func numberChange() {
        delegate?.numberChange()
//        print("123456789")
    }
    
    var stack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        //
        stack.contentMode = .scaleToFill
        //
        return stack
    }()
    
    var labelStory: UILabel = {
        let label = UILabel()
        label.backgroundColor = .brown
        
        return label
    }()
}

extension TestView: ViewConfiguration{
    func buildViewHyeranchy() {
        addSubview(imageBack)
//        imageBack.addSubview(stack)
        addSubview(stack)
        stack.addArrangedSubview(labelStory)
        stack.addArrangedSubview(button)
        stack.addArrangedSubview(button2)
    }
    
    func setupContrants() {
        
        imageBack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        labelStory.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(32)
            make.trailing.leading.equalToSuperview().inset(24)
        }
        
        button.snp.makeConstraints { make in
//            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(75)
            make.width.equalTo(100)
        }
        
        button2.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(button.snp.bottom).offset(24)
            make.height.equalTo(75)
            make.width.equalTo(100)
        }
    }
    
}
