//
//  ViewController.swift
//  Gather-Test
//
//  Created by vijeesh.k on 02/04/21.
//

import UIKit

class GatheredListViewController: UIViewController {

    @IBOutlet private weak var gatheredListTableview: UITableView!
    private let cellIdentifier = "cell-identifier"
    override func viewDidLoad() {
        super.viewDidLoad()
            
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
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        return cell!
    }
}
