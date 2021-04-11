//
//  DrawRectangle.swift
//  Gather-Test
//
//  Created by vijeesh.k on 11/04/21.
//

import UIKit

final class DrawRectangle {
    private let gatheredData: GatheredData!
    private let rectangleBorderWidth: CGFloat = 3.0
    init(gatheredData: GatheredData) {
        self.gatheredData = gatheredData
    }
    
    func drawRectangles(on view: UIView) {
        guard let itemDetails = gatheredData.itemDetails else {
            return
        }
        
        for items in itemDetails {
            let color: UIColor = items.className?.rawValue == "barcode" ? .yellow : .magenta
            let imageWidth = Double(view.frame.size.width)
            let imageHeight = Double(view.frame.size.height)
            
            
            if let originXFromData: Double = items.rect?[0][0],
               let originYFromData: Double = (items.rect?[0][1]),
               let itemWidth: Double = items.rect?[1][0],
               let itemHeight: Double = items.rect?[1][1] {
                
                let calculatedHeight = itemHeight * imageHeight
                let calculatedWidth: Double = itemWidth * imageWidth
                
                var originY = ((originYFromData * imageHeight))
                let originX: Double = originXFromData * imageWidth
                originY += calculatedHeight
                
                let rectangle = CGRect(x: originX, y: originY, width: calculatedWidth, height: calculatedHeight)
                
                draw(rectangle, color, view)
            }
        }
    }
    
    private func draw(_ rectangle: CGRect, _ color: UIColor, _ view: UIView) {
        let borderView = UIView(frame: rectangle)
        borderView.layer.borderColor = color.cgColor
        borderView.frame = borderView.frame.insetBy(dx: -rectangleBorderWidth, dy: -rectangleBorderWidth);
        borderView.layer.borderWidth  = rectangleBorderWidth
        borderView.backgroundColor = .clear
        
        view.addSubview(borderView)
    }
}
