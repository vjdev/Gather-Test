//
//  SummaryTableViewCell.swift
//  Gather-Test
//
//  Created by vijeesh.k on 10/04/21.
//

import UIKit

class SummaryTableViewCell: UITableViewCell {
    @IBOutlet private weak var codeLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!

    override func prepareForReuse() {
        codeLabel.text = nil
        countLabel.text = nil
    }

    func configureWith(code: String, count: Int) {
        codeLabel.text = code
        countLabel.text = "\(count)"
    }
}
