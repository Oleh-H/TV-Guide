//
//  TableViewUpdate.swift
//  TV Guide
//
//  Created by Oleh Haistruk on 16.08.2020.
//  Copyright © 2020 Oleh Haistruk. All rights reserved.
//

import UIKit

class TableViewUpdate {
    var tableView: UITableView?
    
    func updateAfterDataLoaded(dirrection: Int, cellsCount: Int) {
        if dirrection == 1 {
            tableView?.reloadData()
        } else if dirrection == -1 {
            tableView?.reloadData()
            tableView?.scrollToRow(at: IndexPath(row: cellsCount, section: 0), at: .top, animated: false)
        } else {
            tableView?.reloadData()
        }
    }
    
    func updateCellsDuringScrolling(at indexPath: IndexPath) {
        tableView?.beginUpdates()
        tableView?.reloadRows(at: [indexPath], with: .none)
        tableView?.endUpdates()
    }
    
}
