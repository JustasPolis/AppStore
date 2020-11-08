//
//  SuggestionsCollectionViewCell.swift
//  AppStore
//
//  Created by Justin on 2020-10-16.
//

import SDWebImage
import Then
import UIKit
import VanillaConstraints

class SearchResultsCollectionViewCell: UICollectionViewCell {

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

    lazy var screenshotImageView1 = createScreenShotImageView()

    lazy var screenshotImageView2 = createScreenShotImageView()

    lazy var screenshotImageView3 = createScreenShotImageView()

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

    lazy var topStackView = UIStackView(arrangedSubviews: [appIcon, labelsStackView, getButton]).then {
        $0.spacing = 12
        $0.alignment = .center
    }

    lazy var imageStackView = UIStackView(arrangedSubviews: [screenshotImageView1, screenshotImageView2, screenshotImageView3]).then {
        $0.spacing = 8
        $0.distribution = .fillEqually
    }

    lazy var mainStackView = UIStackView(arrangedSubviews: [topStackView, imageStackView]).then {
        $0.spacing = 12
        $0.axis = .vertical
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        mainStackView.add(to: self).pinToEdges(withMargin: 16.0)
        backgroundColor = .white
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createScreenShotImageView() -> UIImageView {
        let imageView = UIImageView().then {
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
            $0.contentMode = .scaleAspectFill
        }
        return imageView
    }
}
