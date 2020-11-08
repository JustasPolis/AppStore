//
//  AppsTabNavigator.swift
//  AppStore
//
//  Created by Justin on 2020-10-16.
//

import UIKit

class AppsTabNavigator {

    private let navigationController: UINavigationController
    private let networkService: NetworkService

    init(navigationController: UINavigationController, networkService: NetworkService) {
        self.navigationController = navigationController
        self.networkService = networkService
    }

    func instantiate() {
        let vm = AppsViewModel(navigator: self, networkService: networkService)
        let vc = AppsViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
}
