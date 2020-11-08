//
//  MusicViewModel.swift
//  AppStore
//
//  Created by Justin on 2020-10-22.
//

import Action
import RxCocoa
import RxSwift
import TinyNetworking

enum LevelState {
    case Normal
    case PowerUp
}

final class MusicViewModel: ViewModelType {

    struct Input {
        let loadTrigger: Observable<Void>
    }

    class InputBuilder {

        func build(_ loadTrigger: Observable<Void>) -> Input {
            Input(loadTrigger: loadTrigger)
        }
    }

    struct Output {
        let tracks: Observable<[Result]>
    }

    private let navigator: MusicTabNavigator
    private let networkService: NetworkService
    lazy var loginAction: Action<Bool, Bool> = {
        Action { [unowned self] loaded in
            .just(loaded)
        }
    }()

    let tinyNetworking = TinyNetworking<Unsplash>()
    let spotify = TinyNetworking<Spotify>()
    let state = Observable.just(false)

    init(navigator: MusicTabNavigator, networkService: NetworkService) {
        self.navigator = navigator
        self.networkService = networkService
    }

    func transform(input: Input) -> Output {

        let fetchTracks = input.loadTrigger.flatMap { _ -> Observable<[Result]> in
            self.tinyNetworking.rx
                .request(resource: .test)
                .map(to: SearchResult.self)
                .map(\.results)
        }

        let tracks = Observable.merge(fetchTracks)

        return Output(tracks: tracks)
    }
}
