//
//  MusicLoadingFooter.swift
//  AppStore
//
//  Created by Justin on 2020-10-22.
//

import UIKit
import VanillaConstraints

class MusicLoadingFooter: UICollectionReusableView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        let activityIndicator = UIActivityIndicatorView(style: .white)
        activityIndicator.color = .darkGray
        activityIndicator.startAnimating()
        activityIndicator.add(to: self).center()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
