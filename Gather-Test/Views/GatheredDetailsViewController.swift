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
        rectangleLayers.isHidden = !toggleButton.isOn
    }

    private func addRectangles() {
        guard let gatheredData = gatheredData, let itemDetails = gatheredData.itemDetails else {
            return
        }
        
        for items in itemDetails {
            let color: UIColor = items.className?.rawValue == "barcode" ? .yellow : .magenta
            
            let imageWidth = Double(imageview.frame.size.width)
            let imageHeight = Double(imageview.frame.size.height)
            
            
            if let originXFromData: Double = items.rect?[0][0],
               let originYFromData: Double = (items.rect?[0][1]),
               let itemWidth: Double = items.rect?[1][0],
               let itemHeight: Double = items.rect?[1][1] {
                
                let calculatedHeight = itemHeight * imageHeight
                let calculatedWidth: Double = itemWidth * imageWidth
                
                var originY = ((originYFromData * imageHeight) + navigationBarHeight)
                let originX: Double = originXFromData * imageWidth
                originY += calculatedHeight
                
                let rectangle = CGRect(x: originX, y: originY, width: calculatedWidth, height: calculatedHeight)
                print("rectangle:",rectangle)
                print("rectangle:",rectangle)
                print("item:",items)
                addBorderView(rectangle, color)
            }
        }
    }
    
    private func addBorderView(_ rectangle: CGRect, _ color: UIColor) {
        let borderView = UIView(frame: rectangle)
        borderView.layer.borderColor = color.cgColor
        borderView.frame = borderView.frame.insetBy(dx: -rectangleBorderWidth, dy: -rectangleBorderWidth);
        borderView.layer.borderWidth  = rectangleBorderWidth
        borderView.backgroundColor = .clear
        imageview.addSubview(borderView)
    }
}

