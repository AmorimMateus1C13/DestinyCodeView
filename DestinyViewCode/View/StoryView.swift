//
//  StoryView.swift
//  DestinyViewCode
//
//  Created by Mateus Amorim on 15/08/22.
//

import UIKit
import SnapKit

protocol DestinyChoiceProtocol {
    func destinyChoice(_ sender: String)
    func updateUI()
}

class StoryView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var delegate: DestinyChoiceProtocol?
    
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
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    var buttonChoice1: UIButton = {
        let button1 = ButtonConfiguration()
        button1.isUserInteractionEnabled = true
        button1.imageButton(with: Constants.Bground.choice1Bg)
        button1.addTarget(self, action: #selector(destiny), for: .touchUpInside)
        return button1
    }()
    
    var buttonChoice2: UIButton = {
        let button2 = ButtonConfiguration()
        button2.imageButton(with: Constants.Bground.choice2Bg)
        button2.addTarget(self, action: #selector(destiny), for: .touchUpInside)
        return button2
    }()
    
    @objc func destiny(_ sender: UIButton){
        if let title = sender.currentTitle {
            delegate?.destinyChoice(title)
        }
    }
}

extension StoryView: ViewConfiguration {
    func buildViewHyeranchy() {
        addSubview(imageBack)
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
            make.top.equalToSuperview().inset(32)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalToSuperview().inset(24)
        }

        storyLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
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
