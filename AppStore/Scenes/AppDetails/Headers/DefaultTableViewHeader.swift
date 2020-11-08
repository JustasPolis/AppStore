//
//  DefaultTableViewHeader.swift
//  AppStore
//
//  Created by Justin on 2020-11-08.
//

import Then
import UIKit
import VanillaConstraints

class DefaultTableViewHeader: UIView {

    let titleLabel = UILabel().then {
        $0.text = "Discover"
        $0.font = .boldSystemFont(ofSize: 21)
    }

    init() {
        super.init(frame: .zero)
        addSeparator(at: .bottom, color: UIColor(white: 0.8, alpha: 1), insets: UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 22.0))
        setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        titleLabel.add(to: self)
            .top(to: \.topAnchor)
            .leading(to: \.leadingAnchor, constant: 20.0)
            .trailing(to: \.trailingAnchor)
            .centerY(to: \.centerYAnchor)
    }
}
