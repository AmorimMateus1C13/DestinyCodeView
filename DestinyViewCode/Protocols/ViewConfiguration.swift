//
//  ViewConfiguration.swift
//  DestinyViewCode
//
//  Created by Mateus Amorim on 15/08/22.
//

import Foundation

protocol ViewConfiguration {
    func setupViewConfiguration()
    func buildViewHyeranchy()
    func setupContrants()
}

extension ViewConfiguration {
    func setupViewConfiguration() {
        buildViewHyeranchy()
        setupContrants()
    }
}
