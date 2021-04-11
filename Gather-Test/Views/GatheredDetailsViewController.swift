//
//  GatheredDetailsViewController.swift
//  Gather-Test
//
//  Created by vijeesh.k on 04/04/21.
//

import UIKit
import CoreGraphics

final class GatheredDetailsViewController: UIViewController {

    @IBOutlet private weak var imageview: UIImageView!
    @IBOutlet weak var rectangleView: UIView!
    private var gatheredData: GatheredData?
    var rectangleLayers = CAShapeLayer()
    
    private let navigationBarHeight = 50.0
    private let rectangleBorderWidth: CGFloat = 2.0
    
    static func viewController(gatheredData: GatheredData) -> GatheredDetailsViewController {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let viewcontroller = storyBoard.instantiateViewController(identifier: "\(GatheredDetailsViewController.self)") as! GatheredDetailsViewController
        viewcontroller.gatheredData = gatheredData
        return viewcontroller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageView()
        addToggleButton()
        addRectangles()
    }

    private func setupImageView() {
        if let image = gatheredData?.imageName {
            imageview.image = UIImage(named: image)
        }
    }
    
    private func addToggleButton() {
        let toggleButton = UISwitch(frame: .zero)
        toggleButton.addTarget(self, action: #selector(self.switchValueDidChange), for: .valueChanged)
        toggleButton.isOn = true
        self.navigationItem.setRightBarButton(UIBarButtonItem(customView: toggleButton), animated: true)
    }

    @IBAction func switchValueDidChange(_ sender: Any) {
        guard  let toggleButton = sender as? UISwitch else {
            return
        }
        rectangleView.isHidden = !toggleButton.isOn
    }

    private func addRectangles() {
        guard let gatheredData = gatheredData else {
            return
        }
        
        let drawRectangle = DrawRectangle(gatheredData: gatheredData)
        drawRectangle.drawRectangles(on: rectangleView)
    }
    
    private func addBorderView(_ rectangle: CGRect, _ color: UIColor) {
        let borderView = UIView(frame: rectangle)
        borderView.layer.borderColor = color.cgColor
        borderView.frame = borderView.frame.insetBy(dx: -rectangleBorderWidth, dy: -rectangleBorderWidth);
        borderView.layer.borderWidth  = rectangleBorderWidth
        borderView.backgroundColor = .clear
        rectangleView.addSubview(borderView)
    }
}

