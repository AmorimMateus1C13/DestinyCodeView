//
//  ButtonConfiguration.swift
//  DestinyViewCode
//
//  Created by Mateus Amorim on 15/08/22.
//

import Foundation
import UIKit
class buttonConfiguration: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func imageButton(with button: String) {
        switch button {
        case Constants.Bground.choice1Bg:
            setBackgroundImage(UIImage(named: Constants.Bground.choice1Bg), for: .normal)
            setTitle(Constants.ToText.button1, for: .normal)
            
        case Constants.Bground.choice2Bg:
            setBackgroundImage(UIImage(named: Constants.Bground.choice2Bg), for: .normal)
            setTitle(Constants.ToText.button2, for: .normal)
            
        default:
            print("Error to set buttons")
        }
    }

}
