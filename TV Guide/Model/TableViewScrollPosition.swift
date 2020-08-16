//
//  TableViewScrollPosition.swift
//  TV Guide
//
//  Created by Oleh Haistruk on 16.08.2020.
//  Copyright © 2020 Oleh Haistruk. All rights reserved.
//

import UIKit

class TableViewScrollPosition {
    
    var dataModel: DataModel?
    
    init(tableInitialOffsetPoint: Bool, dataModel: DataModel?) {
        if tableInitialOffsetPoint {
            dataModel?.loadData(scrollDirection: 0)
            self.dataModel = dataModel
        }
    }
    
    func dataLoadForTopOfTable(contentOffset: CGFloat, direction: CGFloat) {
        if  contentOffset == -2 && direction == 0 {
            dataModel?.loadData(scrollDirection: -1)
        }
    }
    
    func dataLoadForBottomOfTable(indexPath: IndexPath) {
        if let itemsCount = dataModel?.showItems.count, indexPath.row == (itemsCount - 2) {
            dataModel?.loadData(scrollDirection: 1)
        }
    }
}
