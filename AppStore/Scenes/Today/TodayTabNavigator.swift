//
//  TodayTabNavigator.swift
//  AppStore
//
//  Created by Justin on 2020-10-16.
//

import UIKit

class TodayTabNavigator {

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func instantiate() {
        let vc = TodayViewController(navigator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}
