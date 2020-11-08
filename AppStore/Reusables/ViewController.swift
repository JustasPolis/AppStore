//
//  ViewController.swift
//  AppStore
//
//  Created by Justin on 2020-10-20.
//

import RxCocoa
import RxSwift
import UIKit

class ViewController<VM: ViewModelType>: UIViewController {

    var viewModel: VM

    public let disposeBag = DisposeBag()

    public required init(viewModel: VM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
