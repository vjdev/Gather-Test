//
//  GatheredDataModel.swift
//  Gather-Test
//
//  Created by vijeesh.k on 02/04/21.
//

import Foundation

struct GatheredData: Codable {
    var imageName: String?
    var itemDetails: [ItemDetails]?
}

struct ItemDetails: Codable {
    var className: ClassName?
    var score: Double?
    var imageSize: [Double]?
    var rect: [[Double]]?
    var code: String?

    enum CodingKeys: String, CodingKey {
        case className = "className"
        case score = "score"
        case imageSize = "imgSize"
        case rect = "rect"
        case code = "code"
    }
}

enum ClassName: String, Codable {
    case barcode = "barcode"
    case box = "box"
}


