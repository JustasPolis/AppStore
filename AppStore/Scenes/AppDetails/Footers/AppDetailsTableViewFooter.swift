//
//  AppDetailsTableViewFooter.swift
//  AppStore
//
//  Created by Justin on 2020-11-08.
//

import Then
import UIKit
import VanillaConstraints

class AppDetailsTableViewFooter: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .yellow
        setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {}
}
