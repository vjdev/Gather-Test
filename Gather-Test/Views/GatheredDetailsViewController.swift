//
//  GatheredDetailsViewController.swift
//  Gather-Test
//
//  Created by vijeesh.k on 04/04/21.
//

import UIKit

final class GatheredDetailsViewController: UIViewController {

    @IBOutlet private weak var imageview: UIImageView!
    private var gatheredData: GatheredData?
    
    static func viewcontroller(gatheredData: GatheredData) -> GatheredDetailsViewController {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let viewcontroller = storyBoard.instantiateViewController(identifier: "\(GatheredDetailsViewController.self)") as! GatheredDetailsViewController
        viewcontroller.gatheredData = gatheredData
        return viewcontroller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageView()
    }

    private func setupImageView() {
        if let image = gatheredData?.imageName {
            imageview.image = UIImage(named: image)
        }
    }
}
