//
//  StoryView.swift
//  DestinyViewCode
//
//  Created by Mateus Amorim on 15/08/22.
//

import UIKit
import SnapKit

protocol DidClickButton {
    func changeMan()
}

class StoryView: UIView {
    
    var delegate: DidClickButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var imageBack: UIImageView = {
        let background = UIImageView()
        let bundle = Bundle(for: StoryView.self)
        if let image = UIImage(named: Constants.Bground.background, in: bundle, compatibleWith: nil){
            background.image = image
        }
        return background
    }()
    
    var stackVertical: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 20
        stack.distribution = .fill
        stack.contentMode = .scaleToFill
        return stack
    }()
    
    var storyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    @objc func numberSHow(){
        delegate?.changeMan()
    }
    
    var buttonChoice1: UIButton = {
        let button1 = buttonConfiguration()
        button1.isUserInteractionEnabled = true
        button1.imageButton(with: Constants.Bground.choice1Bg)
        button1.addTarget(self, action: #selector(numberSHow), for: .touchUpInside)
        return button1
    }()
    
    var buttonChoice2: UIButton = {
        let button2 = buttonConfiguration()
        button2.imageButton(with: Constants.Bground.choice2Bg)
        button2.addTarget(self, action: #selector(numberSHow), for: .touchUpInside)
        return button2
    }()
}

extension StoryView: ViewConfiguration {
    func buildViewHyeranchy() {
        addSubview(imageBack)
        
        // Não podemos fazer a StackVertical ficar como abaixo. Add ela diretamente na view.
//        imageBack.addSubview(stackVertical)
        
        addSubview(stackVertical)
        stackVertical.addArrangedSubview(storyLabel)
        stackVertical.addArrangedSubview(buttonChoice1)
        stackVertical.addArrangedSubview(buttonChoice2)
    }

    func setupContrants() {

        imageBack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        stackVertical.snp.makeConstraints { make in
            make.trailing.leading.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(24)
        }

        storyLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(32)
            make.trailing.leading.equalToSuperview().inset(24)
        }

        buttonChoice1.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(24)
            make.height.equalTo(75)
        }

        buttonChoice2.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(24)
            make.height.equalTo(75)
        }
    }
}
