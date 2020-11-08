//
//  Application.swift
//  AppStore
//
//  Created by Justin on 2020-10-16.
//

import UIKit

final class Application {

    static let shared = Application()
    let networkService = NetworkService()

    func configureMainInterface(in window: UIWindow) {

        let searchNavController = generateNavController(title: "Search", image: #imageLiteral(resourceName: "search"))
        let todayNavController = generateNavController(title: "Today", image: #imageLiteral(resourceName: "today_icon"))

        let searchTabNavigator = SearchTabNavigator(navigationController: searchNavController, networkService: networkService)
        let todayTabNavigator = TodayTabNavigator(navigationController: todayNavController)

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [searchNavController, todayNavController]
        window.rootViewController = tabBarController

        searchTabNavigator.instantiate()
        todayTabNavigator.instantiate()
    }

    private func generateNavController(title: String, image: UIImage) -> UINavigationController {
        let navController = UINavigationController()
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}
