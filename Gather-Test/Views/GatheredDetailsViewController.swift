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
    private var gatheredData: GatheredData?
    var boxRectangleLayer: CAShapeLayer!
    
    static func viewcontroller(gatheredData: GatheredData) -> GatheredDetailsViewController {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let viewcontroller = storyBoard.instantiateViewController(identifier: "\(GatheredDetailsViewController.self)") as! GatheredDetailsViewController
        viewcontroller.gatheredData = gatheredData
        return viewcontroller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageView()
        drawRectangle()
        addToggleButton()
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
        boxRectangleLayer.isHidden = !toggleButton.isOn
    }

    
    private func drawRectangle() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 50, y: 50))
        
        path.addLine(to: CGPoint(x: 300, y: 50))
        path.addLine(to: CGPoint(x: 300, y: 300))
        path.addLine(to: CGPoint(x: 50, y: 300))
        path.addLine(to: CGPoint(x: 50, y: 50))
        
        boxRectangleLayer = CAShapeLayer()
        boxRectangleLayer.path = path.cgPath
        boxRectangleLayer.strokeColor = UIColor.red.cgColor
        boxRectangleLayer.fillColor = UIColor.clear.cgColor
        boxRectangleLayer.lineWidth = 4
        imageview.layer.insertSublayer(boxRectangleLayer, above: imageview.layer)
    }
        
}

