//
//  AppDetailsViewController.swift
//  AppStore
//
//  Created by Justin on 2020-11-07.
//

import RxDataSources
import RxSwift
import UIKit

class AdvancedViewController: UIViewController {

    var tableView: UITableView!
    private let disposeBag = DisposeBag()
    private let viewModel = AdvancedViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavigationBar()
    }

    func configureNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = .white
    }

    func configureTableView() {
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.add(to: view).pinToEdges()
        tableView.separatorStyle = .none

        viewModel.items
            .bind(to: tableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: disposeBag)
    }
}

extension AdvancedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            case 0:
                return 200
            default:
                return 200
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        print(section)
        switch section {
            case 0:
                let header = TopTableViewHeader()
                return header
            default:
                let header = DefaultTableViewHeader()
                return header
        }
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch section {
            case 0:
                let footer = AppDetailsTableViewFooter()
                return footer
            default:
                return UIView()
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
            case 0:
                return 120
            default:
                return 40
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
            case 0:
                return 180
            default:
                return 0
        }
    }
}

/*

 func createRequest<T>(forType type: T.Type, session: URLSession = URLSession.shared) -> (URLRequest) -> Observable<RequestState<T>> where T: Decodable {
     return { request in
         return Observable.create { observer in
             observer.onNext(.loading)
             let disposable = session.rx.data(request: request)
                 .subscribe { event in
                     switch event {
                         case let .error(error):
                             observer.onNext(.error(error))
                         case let .next(data):
                             do {
                                 let item = try JSONDecoder().decode(type, from: data)
                                 observer.onNext(.loaded(item))
                             }
                             catch {
                                 observer.onNext(.error(error))
                             }
                         case .completed:
                             observer.onCompleted()
                     }
                 }
             return Disposables.create([disposable])
         }
     }
 }

  */
