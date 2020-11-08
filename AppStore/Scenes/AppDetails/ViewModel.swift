//
//  ViewModel.swift
//  AppStore
//
//  Created by Justin on 2020-11-08.
//

import RxSwift

struct AdvancedViewModel {

    let items = BehaviorSubject<[AdvancedTableViewSection]>(value: [
        .GridSection(items: [
            .GridTableViewItem(titles: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"])
        ]),

        .CustomSection(items: [
            .IndicatorTableViewItem,
            .SwitchTableViewItem(isOn: true)
        ]),
        .AnotherSection(items: [
            .IndicatorTableViewItem
        ])
    ])

    let dataSource = AdvancedDataSource.dataSource()
}
