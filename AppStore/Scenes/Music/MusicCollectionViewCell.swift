//
//  MusicCollectionViewCell.swift
//  AppStore
//
//  Created by Justin on 2020-10-22.
//

import Then
import UIKit
import VanillaConstraints

class MusicCollectionViewCell: UICollectionViewCell {

    let imageView = UIImageView().then {
        $0.layer.cornerRadius = 16
        $0.image = #imageLiteral(resourceName: "apps")
        $0.contentMode = .scaleAspectFit
        $0.width(40)
    }

    let nameLabel = UILabel().then {
        $0.text = "Track name"
        $0.font = .boldSystemFont(ofSize: 18)
    }

    lazy var stackView = UIStackView(arrangedSubviews: [imageView, nameLabel]).then {
        $0.spacing = 16
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .brown
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
