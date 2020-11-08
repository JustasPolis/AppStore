//
//  TopTableViewHeader.swift
//  AppStore
//
//  Created by Justin on 2020-11-08.
//

import Then
import UIKit
import VanillaConstraints

class TopTableViewHeader: UIView {

    let titleLabel = UILabel().then {
        $0.text = "Head Ball 2"
        $0.font = .boldSystemFont(ofSize: 20)
    }

    let descriptionLabel = UILabel().then {
        $0.text = "Strike, score & Play Football"
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .darkGray
    }

    let getButton = UIButton(type: .system).then {
        $0.setTitle("GET", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 14)
        $0.width(96)
        $0.height(32)
        $0.backgroundColor = UIColor(white: 0.95, alpha: 1)
        $0.layer.cornerRadius = 16
    }

    lazy var labelStackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, UIView()]).then {
        $0.axis = .vertical
        $0.spacing = 3
    }

    lazy var buttonStackView = UIStackView(arrangedSubviews: [getButton, UIView()])

    lazy var rightStackView = UIStackView(arrangedSubviews: [labelStackView, buttonStackView]).then {
        $0.axis = .vertical
    }

    let appIcon = UIImageView().then {
        $0.backgroundColor = .red
        $0.width(120)
        $0.layer.cornerRadius = 16
        $0.clipsToBounds = true
    }

    lazy var mainStackView = UIStackView(arrangedSubviews: [appIcon, rightStackView]).then {
        $0.spacing = 18
    }

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        mainStackView.add(to: self).pinToEdges(withInsets: UIEdgeInsets(top: 0, left: 14.0, bottom: 0, right: 0))
    }
}
