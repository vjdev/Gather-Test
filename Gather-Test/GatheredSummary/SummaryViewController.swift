//
//  SummaryViewController.swift
//  Gather-Test
//
//  Created by vijeesh.k on 07/04/21.
//

import UIKit

final class SummaryViewController: UIViewController {

    @IBOutlet weak var summaryTableView: UITableView!

    private let cellIdentifier = "SummaryTableViewCell"
    private var gatheredSummary: GatheredSummary? {
        didSet {
            summaryTableView.reloadData()
        }
    }

    static func viewController() -> SummaryViewController {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let viewController = storyBoard.instantiateViewController(identifier: "\(SummaryViewController.self)") as! SummaryViewController
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        registerTableView()
        displaySummaryDetails()
    }

    private func setupTableView() {
        summaryTableView.dataSource = self
        summaryTableView.delegate = self
    }

    private func registerTableView() {
        let nib = UINib(nibName: "\(SummaryTableViewCell.self)", bundle: nil)
        summaryTableView.register(nib, forCellReuseIdentifier: cellIdentifier)
    }

    private func displaySummaryDetails() {
        gatheredSummary = GatheredDataManager.sharedInstance.getSummary()
    }
}

// MARK: - Tableview
extension SummaryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gatheredSummary?.summary.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! SummaryTableViewCell
        if let code = gatheredSummary?.summaryItemCodes?[indexPath.row], let count = gatheredSummary?.summary[code] {
            cell.configureWith(code: code, count: count)
        }
        cell.selectionStyle = .none
        return cell
    }
}
