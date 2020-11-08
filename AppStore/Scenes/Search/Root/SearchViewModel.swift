//
//  SearchViewModel.swift
//  AppStore
//
//  Created by Justin on 2020-11-04.
//

import RxSwift

import RxSwift

final class SearchViewModel: ViewModelType {

    struct Input {
        let modelSelected: Observable<CellModel>
    }

    struct Output {
        let modelSelected: Observable<String>
    }

    private let navigator: SearchTabNavigator
    private let networkService: NetworkService

    init(navigator: SearchTabNavigator, networkService: NetworkService) {
        self.navigator = navigator
        self.networkService = networkService
    }

    func transform(input: Input) -> Output {

        let modelSelected = input.modelSelected.flatMap { model -> Observable<String> in
            switch model {
                case .discover:
                    self.navigator.toApp()
                case .suggested(let suggested):
                    return .just(suggested.text)
                default:
                    break
            }
            return .empty()
        }
        return Output(modelSelected: modelSelected)
    }
}
