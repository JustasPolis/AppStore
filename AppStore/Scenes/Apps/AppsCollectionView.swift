//
//  AppsCollectionView.swift
//  AppStore
//
//  Created by Justin on 2020-10-20.
//

import UIKit

class AppsCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {

    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.backgroundColor = .white
        self.delegate = self
        self.dataSource = self
        self.register(AppsCollectionViewCell.self, forCellWithReuseIdentifier: AppsCollectionViewCell.reuseID)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: self.frame.width, height: 325)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsCollectionViewCell.reuseID, for: indexPath) as! AppsCollectionViewCell
        return cell
    }
}
