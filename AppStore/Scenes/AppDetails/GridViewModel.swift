//
//  GridViewModel.swift
//  AppStore
//
//  Created by Justin on 2020-11-08.
//

import RxSwift

struct GridViewModel {

    let titles = BehaviorSubject<[String]>(value: [])

    init(titles: [String]) {
        self.titles.onNext(titles)
    }
}
