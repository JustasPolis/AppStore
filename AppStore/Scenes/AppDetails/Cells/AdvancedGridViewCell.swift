//
//  AdvancedGridViewCell.swift
//  AppStore
//
//  Created by Justin on 2020-11-08.
//

import RxSwift
import UIKit

class AdvancedGridTableViewCell: UITableViewCell {

    var collectionView: UICollectionView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        self.selectionStyle = .none
        configureCollectionView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Properties

    private let disposeBag = DisposeBag()
    var viewModel: GridViewModel!

    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .blue
        collectionView.register(cellType: AppImageCollectionViewCell.self)
        collectionView.dataSource = self
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        collectionView.add(to: self).pinToEdges(withInsets: UIEdgeInsets(top: 16.0, left: 0, bottom: 0, right: 0))
        flowLayout.scrollDirection = .horizontal
        collectionView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)

        collectionView.rx.itemSelected.subscribe(onNext: { _ in
            print("ITS COLLECTIONVIEW")
        })
    }
}

extension AdvancedGridTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(ofType: AppImageCollectionViewCell.self, at: indexPath)
        return cell
    }
}

extension AdvancedGridTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 4
        let hardCodedPadding: CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
