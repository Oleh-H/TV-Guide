//
//  DataModel.swift
//  TV Guide
//
//  Created by Oleh Haistruk on 15.08.2020.
//  Copyright © 2020 Oleh Haistruk. All rights reserved.
//

import UIKit

class DataModel {
    
    private let network = Network()
    let tableViewUpdate = TableViewUpdate()
    let loadingVisualization = LoadingVisualization()
    
    var showItems = [ShowItem]()
    private var borderID = 0
    
    private lazy var imagesLoadingQueue = OperationQueue()
    
    init(tableView: UITableView?) {
        self.tableViewUpdate.tableView = tableView
        self.loadingVisualization.tableView = tableView
    }
    
    
    
    func loadData(scrollDirection: Int) {
        if scrollDirection == -1, let firstID = showItems.first?.id {
            //to the top
            borderID = firstID
            loadingVisualization.runLoadingIndicator()
        } else if scrollDirection == 1, let lastID = showItems.last?.id {
            //to the bottom
            borderID = lastID
            loadingVisualization.runLoadingIndicator()
        }
        network.getShowItems(borderID: borderID, direction: scrollDirection) { [weak self] (tvGuideData) in
            self?.appendNewItems(items: tvGuideData.items, scrollDirection: scrollDirection)
        }
    }
    
    
    
    func appendNewItems(items: [ShowItem], scrollDirection: Int) {
        if scrollDirection == 1 {
            self.showItems.append(contentsOf: items)
        } else if scrollDirection == -1 {
            var newItems: [ShowItem] = items
            newItems.append(contentsOf: self.showItems)
            self.showItems = newItems
        } else {
            showItems = items
        }
        tableViewUpdate.updateAfterDataLoaded(dirrection: scrollDirection, cellsCount: items.count)
        loadingVisualization.stopLoadingIndicator()
    }
    
    
    func loadImages(for indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            let index = indexPath.row
            guard showItems[index].imageData == nil else { return }
            let imageLoadingOperation = ImageLoadingOpreation(imageURL: showItems[index].iconURL)
            imageLoadingOperation.onCompletion = { [weak self] imageData in
                self?.showItems[index].imageData = imageData
                self?.tableViewUpdate.updateCellsDuringScrolling(at: indexPath)
            }
            imagesLoadingQueue.addOperation(imageLoadingOperation)
        }
    }

}
