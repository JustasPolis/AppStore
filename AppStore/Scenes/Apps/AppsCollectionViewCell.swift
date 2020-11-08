//
//  AppsCollectionViewCell.swift
//  AppStore
//
//  Created by Justin on 2020-10-20.
//

import UIKit

class AppsCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .brown
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
