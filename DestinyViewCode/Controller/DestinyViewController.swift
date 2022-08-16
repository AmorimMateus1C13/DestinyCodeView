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
    var story = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(storyView)
        makeConstrants()
        storyView.delegate = self
        updateUI()
    }
    
    func makeConstrants() {
        storyView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension DestinyViewController: DestinyChoiceProtocol {
    
    func updateUI() {
        storyView.storyLabel.text = story.getStoryTitle()
        storyView.buttonChoice1.setTitle(story.getChoice1(), for: .normal)
        storyView.buttonChoice2.setTitle(story.getChoice2(), for: .normal)
    }
    
    func destinyChoice(_ sender: String) {
        story.nextStory(userChoice: sender)
        updateUI()
    }
}
