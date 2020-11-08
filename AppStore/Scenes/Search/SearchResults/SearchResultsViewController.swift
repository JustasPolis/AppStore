//
//  SearchResultsViewControlleer.swift
//  AppStore
//
//  Created by Justin on 2020-10-16.
//

import RxCocoa
import RxSwift
import UIKit
import VanillaConstraints

class SearchResultsViewController: UIViewController {

    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollectionView()
    }

    func configureCollectionView() {

        // MARK: CollectionView configuration

        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.collectionView.backgroundColor = .white
        self.collectionView.add(to: view).pinToEdges()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self

        self.collectionView.register(cellType: SearchResultsCollectionViewCell.self)

        // MARK: FlowLayout configuration

        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 275)
    }
}

extension SearchResultsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(ofType: SearchResultsCollectionViewCell.self, at: indexPath)
        return cell
    }
}

extension SearchResultsViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
}
