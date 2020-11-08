//
//  ViewModelType.swift
//  AppStore
//
//  Created by Justin on 2020-10-20.
//

import Foundation

protocol ViewModelType {

    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}
