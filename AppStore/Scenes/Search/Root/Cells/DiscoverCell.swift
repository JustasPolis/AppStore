//
//  SearchTableViewDiscoverCell.swift
//  AppStore
//
//  Created by Justin on 2020-11-07.
//

import Then
import UIKit
import VanillaConstraints

class DiscoverCell: UITableViewCell {

    let titleLabel = UILabel().then {
        $0.text = "snake"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .blue
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel.add(to: self)
            .top(to: \.topAnchor, constant: 12.0)
            .leading(to: \.leadingAnchor, constant: 20.0)
            .trailing(to: \.trailingAnchor)
            .bottom(to: \.bottomAnchor, constant: 12.0)
        addSeparator(at: .bottom, color: UIColor(white: 0.8, alpha: 1), insets: UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 44.0))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
