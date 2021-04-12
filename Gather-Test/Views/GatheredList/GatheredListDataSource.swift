//
//  GatheredListDataSource.swift
//  Gather-Test
//
//  Created by vijeesh.k on 11/04/21.
//

import UIKit

final class GatheredListDataSource: NSObject, UICollectionViewDataSource {

    private let cellIdentifier = "ImageCollectionViewCell"
    var gatheredDataArray: [GatheredData]?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gatheredDataArray?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ImageCollectionViewCell
        let gatheredData = gatheredDataArray?[indexPath.row]
        if let imageName = gatheredData?.imageName {
            cell.configureCell(with: UIImage(named: imageName))
        }
        return cell
    }
}
