//
//  Double+Extension.swift
//  AppStore
//
//  Created by Justin on 2020-10-19.
//

import Foundation

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return Darwin.round(self * divisor) / divisor
    }
}
