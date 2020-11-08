//
//  MusicTabNavigator.swift
//  AppStore
//
//  Created by Justin on 2020-10-22.
//

import UIKit

class MusicTabNavigator {

    private let navigationController: UINavigationController
    private let networkService: NetworkService

    init(navigationController: UINavigationController, networkService: NetworkService) {
        self.navigationController = navigationController
        self.networkService = networkService
    }

    func instantiate() {
        let vm = MusicViewModel(navigator: self, networkService: networkService)
        let vc = MusicViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
}
