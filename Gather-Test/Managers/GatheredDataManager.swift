//
//  GatheredDataManager.swift
//  Gather-Test
//
//  Created by vijeesh.k on 02/04/21.
//

import Foundation

final class GatheredDataManager {
    
    private let totalFiles = 24
    
    func getGatheredData() -> [GatheredData]? {
        var gatheredDataArray = [GatheredData]()
        for fileIndex in 0..<totalFiles {
            let fileName = getFileName(index: fileIndex)
            let path = Bundle.main.path(forResource: fileName, ofType: "json")
            let jsonData = try! String(contentsOfFile: path!).data(using: .utf8)!
            if let itemDetails = try? JSONDecoder().decode([ItemDetails].self, from: jsonData) {
                var gatheredData = GatheredData()
                gatheredData.imageName = fileName
                gatheredData.itemDetails = itemDetails
                gatheredDataArray.append(gatheredData)
            }
        }
        return gatheredDataArray
    }
    
    func getFileName(index: Int) -> String {
        if index < 10 {
            return "img000\(index)"
        }
        return "img00\(index)"
    }
}



