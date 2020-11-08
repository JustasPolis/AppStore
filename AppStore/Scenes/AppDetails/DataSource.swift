//
//  DataSource.swift
//  AppStore
//
//  Created by Justin on 2020-11-08.
//

import RxDataSources

enum AdvancedTableViewItem {
    /// Represents a cell with a collection view inside
    case GridTableViewItem(titles: [String])
    /// Represents a cell with a switch
    case SwitchTableViewItem(isOn: Bool)
    /// Represents a cell with a disclosure indicator
    case IndicatorTableViewItem
}

enum AdvancedTableViewSection {
    case GridSection(items: [AdvancedTableViewItem])
    case CustomSection(items: [AdvancedTableViewItem])
    case AnotherSection(items: [AdvancedTableViewItem])
}

extension AdvancedTableViewSection: SectionModelType {
    typealias Item = AdvancedTableViewItem

    var header: String {
        switch self {
            case .GridSection:
                return "Grid Section"
            case .CustomSection:
                return "Custom Section"
            case .AnotherSection:
                return "Another Section"
        }
    }

    var items: [AdvancedTableViewItem] {
        switch self {
            case let .GridSection(items: items):
                return items
            case let .CustomSection(items: items):
                return items
            case let .AnotherSection(items: items):
                return items
        }
    }

    init(original: Self, items: [Self.Item]) {
        self = original
    }
}

struct AdvancedDataSource {
    typealias DataSource = RxTableViewSectionedReloadDataSource

    static func dataSource() -> DataSource<AdvancedTableViewSection> {
        .init(configureCell: { dataSource, _, indexPath, _ -> UITableViewCell in

            switch dataSource[indexPath] {
                case let .GridTableViewItem(titles):
                    let cell = AdvancedGridTableViewCell()
                    cell.contentView.isUserInteractionEnabled = false
                    cell.viewModel = GridViewModel(titles: titles)
                    return cell
                case .SwitchTableViewItem:
                    let cell = AdvancedSwitchTableViewCell()
                    return cell
                case .IndicatorTableViewItem:
                    let cell = AdvancedIndicatorTableViewCell()
                    return cell
            }
        }, titleForHeaderInSection: { dataSource, index in
            dataSource.sectionModels[index].header
        })
    }
}
