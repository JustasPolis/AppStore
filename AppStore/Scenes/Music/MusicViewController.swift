//
//  MusicViewController.swift
//  AppStore
//
//  Created by Justin on 2020-10-22.
//

import RxCocoa
import RxSwift
import TinyNetworking
import UIKit
import VanillaConstraints

import RxCocoa
import RxSwift
import UIKit

public extension Reactive where Base: UIScrollView {
    /**
     Shows if the bottom of the UIScrollView is reached.
     - parameter offset: A threshhold indicating the bottom of the UIScrollView.
     - returns: ControlEvent that emits when the bottom of the base UIScrollView is reached.
     */
    func reachedBottom(offset: CGFloat = 20.0) -> ControlEvent<Bool> {
        let source = contentOffset.map { contentOffset -> Bool in
            let visibleHeight = self.base.frame.height - self.base.contentInset.top - self.base.contentInset.bottom
            let y = contentOffset.y + self.base.contentInset.top + self.base.contentInset.bottom
            let threshold = max(offset, self.base.contentSize.height - visibleHeight - offset)
            return y >= threshold
        }
        .distinctUntilChanged()

        return ControlEvent(events: source)
    }
}

class MusicViewController: ViewController<MusicViewModel> {

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let tinyNetworking = TinyNetworking<Unsplash>()
    var input: MusicViewModel.Input!

    override func viewDidLoad() {

        let output = viewModel.transform(input: input)
        print("hello")

        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        viewModel.state.bind { _ in
            layout.footerReferenceSize.height = 50
        }.disposed(by: disposeBag)
        title = "Music"
        collectionView.add(to: view).pinToEdges()
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.register(MusicCollectionViewCell.self, forCellWithReuseIdentifier: MusicCollectionViewCell.reuseID)
        collectionView.register(MusicLoadingFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "FooterId")
        collectionView
            .rx.delegate
            .setForwardToDelegate(self, retainDelegate: false)

        output.tracks.bind(to: collectionView.rx.items) { collectionView, row, element in
            let indexPath = IndexPath(row: row, section: 0)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicCollectionViewCell.reuseID, for: indexPath) as! MusicCollectionViewCell
            cell.nameLabel.text = element.trackName
            return cell
        }
        .disposed(by: disposeBag)
    }
}

extension MusicViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FooterId", for: indexPath)

        return footer
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        .init(width: view.frame.width, height: 100)
    }
}
