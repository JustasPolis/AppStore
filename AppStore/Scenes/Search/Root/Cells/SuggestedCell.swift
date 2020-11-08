//
//  SearchTableViewSuggestedCell.swift
//  AppStore
//
//  Created by Justin on 2020-11-07.
//

import Then
import UIKit
import VanillaConstraints

class SuggestedCell: UITableViewCell {

    let appIcon = UIImageView().then {
        $0.backgroundColor = .red
        $0.height(60)
        $0.width(60)
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
    }

    let nameLabel = UILabel().then {
        $0.text = "App Name"
    }

    let categoryLabel = UILabel().then {
        $0.text = "Photos & Video"
    }

    let ratingsLabel = UILabel().then {
        $0.text = "9.26M"
    }

    let getButton = UIButton(type: .system).then {
        $0.setTitle("GET", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 14)
        $0.width(80)
        $0.height(32)
        $0.backgroundColor = UIColor(white: 0.95, alpha: 1)
        $0.layer.cornerRadius = 16
    }

    lazy var labelsStackView = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel]).then {
        $0.axis = .vertical
    }

    lazy var mainStackView = UIStackView(arrangedSubviews: [appIcon, labelsStackView, getButton]).then {
        $0.spacing = 12
        $0.alignment = .center
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        mainStackView.add(to: self).then {
            $0.top(to: \.topAnchor, constant: 12.0)
            $0.leading(to: \.leadingAnchor, constant: 20.0)
            $0.trailing(to: \.trailingAnchor, constant: 22.0)
            $0.bottom(to: \.bottomAnchor, constant: 12.0)
        }
        addSeparator(at: .bottom, color: UIColor(white: 0.8, alpha: 1), insets: UIEdgeInsets(top: 0.0, left: 92.0, bottom: 0.0, right: 22.0))
        backgroundColor = .white
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
