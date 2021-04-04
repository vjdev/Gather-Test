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
    }

    private func setupImageView() {
        if let image = gatheredData?.imageName {
            imageview.image = UIImage(named: image)
        }
    }
    
    func drawRectangle() {
        let path = UIBezierPath()
               path.move(to: CGPoint(x: 50, y: 50))
        
               path.addLine(to: CGPoint(x: 300, y: 50))
               path.addLine(to: CGPoint(x: 300, y: 300))
               path.addLine(to: CGPoint(x: 50, y: 300))
        
               path.addLine(to: CGPoint(x: 50, y: 50))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 4
        imageview.layer.insertSublayer(shapeLayer, above: imageview.layer)
    }
        
}

