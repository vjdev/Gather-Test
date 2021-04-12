//
//  GatheredDataModel.swift
//  Gather-Test
//
//  Created by vijeesh.k on 02/04/21.
//

import Foundation
import UIKit

struct GatheredData: Codable {
    var imageName: String?
    var itemDetails: [ItemDetails]?
}

struct ItemDetails: Codable {
    var itemColor: UIColor {
        return className?.rawValue == "barcode" ? .yellow : .magenta
    }
    var rectange: CGRect {
        if let originX = rect?[0][0],
           let originY = (rect?[0][1]),
           let width = rect?[1][0],
           let height = rect?[1][1],
           let imageWidth = imgSize?[0],
           let imageHeight = imgSize?[1]{
            return CGRect(x: originX * imageWidth, y: originY * imageHeight, width:  width * imageWidth, height: height * imageHeight)
        }
        return .zero
    }
    
    var className: ClassName?
    var code: String?
    private var score: Double?
    private var imgSize: [Double]?
    private var rect: [[Double]]?
    
}

enum ClassName: String, Codable {
    case barcode = "barcode"
    case box = "box"
}


