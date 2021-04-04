//
//  ViewController.swift
//  Gather-Test
//
//  Created by vijeesh.k on 02/04/21.
//

import UIKit

final class GatheredListViewController: UIViewController {

    @IBOutlet private weak var gatheredListTableview: UITableView!
    private let cellIdentifier = "cell-identifier"
    private var gatheredDataArray: [GatheredData]? {
        didSet {
            gatheredListTableview.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableview()
        gatheredDataArray = GatheredDataManager().getGatheredData()
    }
    
    private func setupTableview() {
        registerTableView()
        gatheredListTableview.delegate = self
        gatheredListTableview.dataSource = self
    }
    
    private func registerTableView() {
        gatheredListTableview.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

// MARK: - Tableview
extension GatheredListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gatheredDataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        let gatheredData = gatheredDataArray?[indexPath.row]
        cell?.textLabel?.text = gatheredData?.imageName
        return cell!
    }
}
