//
//  AppsViewController.swift
//  AppStore
//
//  Created by Justin on 2020-10-16.
//

import RxSwift
import UIKit

class AppsViewController: ViewController<AppsViewModel> {

    let collectionView = AppsCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Apps"
    }

    override func loadView() {
        view = collectionView
    }
}
