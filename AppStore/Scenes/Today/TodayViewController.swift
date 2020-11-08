//
//  TodayViewController.swift
//  AppStore
//
//  Created by Justin on 2020-10-16.
//

import UIKit

class TodayViewController: UIViewController {

    let navigator: TodayTabNavigator

    required init(navigator: TodayTabNavigator) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Today"
    }

    override func loadView() {
        view = TodayView()
    }
}
