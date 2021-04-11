//
//  SummaryViewController.swift
//  Gather-Test
//
//  Created by vijeesh.k on 07/04/21.
//

import UIKit

final class SummaryViewController: UIViewController {

    @IBOutlet weak var summaryTableView: UITableView!
    
    let cellIdentifier = "SummaryTableViewCell"
    var summary = Dictionary<String?, Int>()
    var summaryItemCodes = [String?]()
    
    static func viewController() -> SummaryViewController {
        let storyBoard  = UIStoryboard.init(name: "Main", bundle: Bundle.main)
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
        guard let summaryArray = GatheredDataManager.sharedInstance.getGatheredItemSummary() else {
            return
        }
        
        for item in summaryArray {
            summaryItemCodes.append(item.code)
        }

        let mappedItems = summaryItemCodes.map { ($0, 1) }
        summary = Dictionary(mappedItems, uniquingKeysWith: +)
        summaryTableView.reloadData()
    }
}

extension SummaryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return summary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! SummaryTableViewCell
        if let code = summaryItemCodes[indexPath.row], let count = summary[code] {
            cell.configureWith(code: code, count: count)
        }
        return cell
    }
}

