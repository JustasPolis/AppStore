//
//  SearchViewController1.swift
//  AppStore
//
//  Created by Justin on 2020-11-07.
//

import RxCocoa
import RxDataSources
import RxSwift
import Then
import UIKit
import VanillaConstraints

struct Suggested {
    let text: String
}

struct Discover {
    let text: String
}

enum CellModel {
    case suggested(Suggested)
    case discover(Discover)
}

class SearchViewController: UIViewController, UITableViewDelegate {

    private var searchController: UISearchController!
    private var tableView: UITableView!
    let disposeBag = DisposeBag()
    let viewModel: SearchViewModel

    public required init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, CellModel>>(configureCell: { _, table, _, item in
        switch item {
            case .suggested(let suggested):
                let cell = table.dequeueReusableCell(withIdentifier: DiscoverCell.reuseID)!
                cell.selectionStyle = .none
                return cell
            case .discover(let discover):
                let cell = table.dequeueReusableCell(withIdentifier: SuggestedCell.reuseID)!
                cell.selectionStyle = .none
                return cell
        }
    })

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        self.searchController = UISearchController(searchResultsController: vc)
        self.searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.title = "Search"
        navigationController?.navigationBar.sizeToFit()
        self.navigationController?.navigationBar.isTranslucent = true
      
        self.configureTableView()

        let input = SearchViewModel.Input(modelSelected: self.tableView.rx.modelSelected(CellModel.self).asObservable())
        let output = self.viewModel.transform(input: input)
        output.modelSelected.bind { text in
            self.searchController.searchBar.text = text
            self.searchController.isActive = true
        }.disposed(by: self.disposeBag)
    }

    func configureTableView() {

        // MARK: TableView configuration

        self.tableView = UITableView(frame: .zero, style: .grouped)
        self.tableView.backgroundColor = .white
        self.tableView.add(to: view).pinToEdges()

        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none

        self.tableView.register(cellType: DiscoverCell.self)
        self.tableView.register(cellType: SuggestedCell.self)

        let dataSource = self.dataSource

        let items = Observable.just([
            SectionModel(model: "Discover", items: [
                CellModel.suggested(.init(text: "Third item")),
                CellModel.suggested(.init(text: "Third item")),
                CellModel.suggested(.init(text: "Third item")),
                CellModel.suggested(.init(text: "Third item"))
            ]),
            SectionModel(model: "Suggested", items: [
                CellModel.discover(.init(text: "Third item")),
                CellModel.discover(.init(text: "Fourth item")),
                CellModel.discover(.init(text: "Fourth item")),
                CellModel.discover(.init(text: "Fourth item")),
                CellModel.discover(.init(text: "Third item")),
                CellModel.discover(.init(text: "Fourth item")),
                CellModel.discover(.init(text: "Fourth item")),
                CellModel.discover(.init(text: "Fourth item"))
            ])
        ])

        items
            .bind(to: self.tableView.rx.items(dataSource: dataSource))
            .disposed(by: self.disposeBag)

        self.tableView.rx
            .setDelegate(self)
            .disposed(by: self.disposeBag)
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SearchTableViewHeader()
        headerView.titleLabel.text = self.dataSource[section].model
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
}
