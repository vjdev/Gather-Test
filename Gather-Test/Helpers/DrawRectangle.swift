//
//  DrawRectangle.swift
//  Gather-Test
//
//  Created by vijeesh.k on 11/04/21.
//

import UIKit

final class DrawRectangle {
    private let gatheredData: GatheredData!
    private let rectangleBorderWidth: CGFloat = 1.5
    
    init(gatheredData: GatheredData) {
        self.gatheredData = gatheredData
    }
    
    func drawRectangles(on view: UIImageView) {
        guard let itemDetails = gatheredData.itemDetails else {
            return
        }
        
        for items in itemDetails {
            let color: UIColor = items.rectangleColor
            let originXFromData: Double = Double(items.rectange.origin.x)
            let originYFromData: Double = Double(items.rectange.origin.y)
            let itemWidth: Double = Double(items.rectange.size.width)
            let itemHeight: Double = Double(items.rectange.size.height)
            
            
            let rect = CGRect(x: originXFromData, y: originYFromData, width: itemWidth, height: itemHeight)
            let convertedRect = view.convertRect(fromImageRect: rect)
            let finalRect = CGRect(x: convertedRect.origin.x, y: view.frame.height - convertedRect.origin.y - convertedRect.height , width: convertedRect.width, height: convertedRect.height)
            draw(finalRect, color, view)
        }
    }
    
    private func draw(_ rectangle: CGRect, _ color: UIColor, _ view: UIView) {
        let borderView = UIView(frame: rectangle)
        borderView.backgroundColor = .clear
        borderView.layer.borderColor = color.cgColor
        borderView.layer.borderWidth = rectangleBorderWidth
        borderView.frame = borderView.frame.insetBy(dx: -rectangleBorderWidth, dy: -rectangleBorderWidth);
        borderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(borderView)
    }
}

