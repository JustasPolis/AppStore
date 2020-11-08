//
//  Unsplash.swift
//  AppStore
//
//  Created by Justin on 2020-10-22.
//

import TinyNetworking

enum Unsplash {
    case test
}

extension Unsplash: Resource {
    var baseURL: URL {
        URL(string: "https://itunes.apple.com/search?term=Instagram&entity=software")!
    }

    var endpoint: Endpoint {
        switch self {
            case .test:
                return .get(path: "")
        }
    }

    var task: Task {
        let params: [String: Any] = [:]
        return .requestWithParameters(params, encoding: URLEncoding())
    }

    var headers: [String: String] {
        ["Authorization": "Bearer xxx"]
    }

    var cachePolicy: URLRequest.CachePolicy {
        .useProtocolCachePolicy
    }
}

enum Spotify {
    case test
}

extension Spotify: Resource {
    var baseURL: URL {
        URL(string: "https://itunes.apple.com/search?term=Facebook&entity=software")!
    }

    var endpoint: Endpoint {
        switch self {
            case .test:
                return .get(path: "")
        }
    }

    var task: Task {
        let params: [String: Any] = [:]
        return .requestWithParameters(params, encoding: URLEncoding())
    }

    var headers: [String: String] {
        ["Authorization": "Bearer xxx"]
    }

    var cachePolicy: URLRequest.CachePolicy {
        .useProtocolCachePolicy
    }
}
