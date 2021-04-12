//
//  ImageCollectionViewCell.swift
//  Gather-Test
//
//  Created by vijeesh.k on 04/04/21.
//

import UIKit

final class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var itemImage: UIImageView!

    override func prepareForReuse() {
        itemImage.image = nil
    }

    func configureCell(with image: UIImage?) {
        itemImage.image = image
    }
}
