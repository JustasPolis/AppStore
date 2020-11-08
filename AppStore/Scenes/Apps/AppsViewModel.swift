//
//  AppsViewModel.swift
//  AppStore
//
//  Created by Justin on 2020-10-20.
//

import RxCocoa
import RxSwift

final class AppsViewModel: ViewModelType {

    struct Input {}

    struct Output {}

    private let navigator: AppsTabNavigator
    private let networkService: NetworkService

    init(navigator: AppsTabNavigator, networkService: NetworkService) {
        self.navigator = navigator
        self.networkService = networkService
    }

    func transform(input: Input) -> Output {

        Output()
    }
}
