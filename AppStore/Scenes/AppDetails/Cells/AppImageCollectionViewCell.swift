//
//  AdvancedCollectionViewCell.swift
//  AppStore
//
//  Created by Justin on 2020-11-08.
//

import Then
import UIKit
import VanillaConstraints

class AppImageCollectionViewCell: UICollectionViewCell {

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
