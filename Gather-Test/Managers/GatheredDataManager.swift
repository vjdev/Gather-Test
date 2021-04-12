//
//  GatheredDataManager.swift
//  Gather-Test
//
//  Created by vijeesh.k on 02/04/21.
//

import Foundation

final class GatheredDataManager {

    static let sharedInstance = GatheredDataManager()

    private init() {
    }

    private let totalFiles = 24
    private var itemDetailsSummary = [ItemDetails]()

    @discardableResult
    func getGatheredData() -> [GatheredData]? {
        var gatheredDataArray = [GatheredData]()
        for fileIndex in 0..<totalFiles {
            let fileName = getFileName(index: fileIndex)
            let path = Bundle.main.path(forResource: fileName, ofType: "json")
            let jsonData = try! String(contentsOfFile: path!).data(using: .utf8)!
            if let itemDetails = try? JSONDecoder().decode([ItemDetails].self, from: jsonData) {
                var gatheredData = GatheredData()
                gatheredData.imageName = "\(fileName).jpg"
                gatheredData.itemDetails = itemDetails
                gatheredDataArray.append(gatheredData)
                itemDetailsSummary.append(contentsOf: itemDetails)
            }
        }
        return gatheredDataArray
    }

    func getGatheredItemSummary() -> [ItemDetails]? {
        itemDetailsSummary.filter { $0.isBarCode && $0.isCodeAvailable }
    }

    func getFileName(index: Int) -> String {
        if index < 10 {
            return "img000\(index)"
        }
        return "img00\(index)"
    }

    func getSummary() -> GatheredSummary? {
        var summary = Dictionary<String?, Int>()
        var summaryItemCodes = [String?]()
        
        guard let summaryArray = GatheredDataManager.sharedInstance.getGatheredItemSummary() else {
            return nil
        }
        
        for item in summaryArray {
            summaryItemCodes.append(item.code)
        }

        let mappedItems = summaryItemCodes.map { ($0, 1) }
        summary = Dictionary(mappedItems, uniquingKeysWith: +)
        return GatheredSummary(summary: summary, summaryItemCodes: summaryItemCodes)
    }
}

