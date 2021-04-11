//
//  ViewController.swift
//  Gather-Test
//
//  Created by vijeesh.k on 02/04/21.
//

import UIKit

final class GatheredListViewController: UIViewController {

    private let cellIdentifier = "ImageCollectionViewCell"
    @IBOutlet private weak var gatheredListCollectionView: UICollectionView!
    private var gatheredDataArray: [GatheredData]? {
        didSet {
            gatheredListCollectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavigationBarButtons()
        setupCollectionView()
        gatheredDataArray = GatheredDataManager.sharedInstance.getGatheredData()
    }
    
    private func addNavigationBarButtons() {
        let viewSummary = UIBarButtonItem(title: "View Summary", style: .plain, target: self, action: #selector(viewSummaryButtonClicked))
        navigationItem.rightBarButtonItem = viewSummary
    }
    
    @objc
    private func viewSummaryButtonClicked() {
        let summaryVC = SummaryViewController.viewController()
        navigationController?.pushViewController(summaryVC, animated: true)
    }
    
    private func setupCollectionView() {
        registerCollectionView()
        gatheredListCollectionView.delegate = self
        gatheredListCollectionView.dataSource = self
    }
    
    private func registerCollectionView() {
        let nib = UINib(nibName: "\(ImageCollectionViewCell.self)", bundle: nil)
        gatheredListCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
}

// MARK: - CollectionView
extension GatheredListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        if let selectedItem = gatheredDataArray?[indexPath.row], let _ = selectedItem.imageName {
            let detailViewcontroller = GatheredDetailsViewController.viewcontroller(gatheredData: selectedItem)
            navigationController?.pushViewController(detailViewcontroller, animated: true)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let widthForItem = (width / 2) - 6
        return CGSize(width: widthForItem, height: 130)
    }
}
