//
//  AdvancedSwitchViewCell.swift
//  AppStore
//
//  Created by Justin on 2020-11-08.
//

import RxSwift
import UIKit

class AdvancedSwitchTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .purple
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
