//
//  SearchTabNavigator.swift
//  AppStore
//
//  Created by Justin on 2020-10-16.
//

import UIKit

class SearchTabNavigator {

    let navigationController: UINavigationController
    let networkService: NetworkService

    init(navigationController: UINavigationController, networkService: NetworkService) {
        self.networkService = networkService
        self.navigationController = navigationController
    }

    func instantiate() {
        let vm = SearchViewModel(navigator: self, networkService: networkService)
        let vc = SearchViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }

    func toApp() {
        let vc = AdvancedViewController()
        navigationController.pushViewController(vc, animated: true)
    }
}
