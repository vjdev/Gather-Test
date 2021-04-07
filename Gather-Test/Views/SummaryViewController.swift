//
//  SummaryViewController.swift
//  Gather-Test
//
//  Created by vijeesh.k on 07/04/21.
//

import UIKit

class SummaryViewController: UIViewController {

    static func viewController() -> SummaryViewController {
        let storyBoard  = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let viewController = storyBoard.instantiateViewController(identifier: "\(SummaryViewController.self)") as! SummaryViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
