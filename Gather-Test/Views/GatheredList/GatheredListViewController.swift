//
//  ViewController.swift
//  Gather-Test
//
//  Created by vijeesh.k on 02/04/21.
//

import UIKit

final class GatheredListViewController: UIViewController {

    @IBOutlet private weak var gatheredListCollectionView: UICollectionView!
    
    private let cellIdentifier = "ImageCollectionViewCell"
    private var dataSource: GatheredListDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavigationBarButtons()
        dataSource = GatheredListDataSource()
        setupCollectionView()
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
        dataSource.gatheredDataArray = GatheredDataManager.sharedInstance.getGatheredData()
        gatheredListCollectionView.dataSource = dataSource
        gatheredListCollectionView.reloadData()
    }
    
    private func registerCollectionView() {
        let nib = UINib(nibName: "\(ImageCollectionViewCell.self)", bundle: nil)
        gatheredListCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
}

// MARK: - CollectionView Delegate
extension GatheredListViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        if let selectedItem = dataSource.gatheredDataArray?[indexPath.row], let _ = selectedItem.imageName {
            let detailViewController = GatheredDetailsViewController.viewController(gatheredData: selectedItem)
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let widthForItem = (width / 2) - 6
        return CGSize(width: widthForItem, height: 130)
    }
}
