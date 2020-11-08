//
//  AdvancedIndicatorViewCell.swift
//  AppStore
//
//  Created by Justin on 2020-11-08.
//

import UIKit
import RxSwift

class AdvancedIndicatorTableViewCell: UITableViewCell {

    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .green
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

