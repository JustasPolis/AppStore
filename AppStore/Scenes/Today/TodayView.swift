//
//  TodayView.swift
//  AppStore
//
//  Created by Justin on 2020-10-16.
//

import Then
import UIKit
import VanillaConstraints

class TodayView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {}
}
