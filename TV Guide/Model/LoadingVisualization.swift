//
//  LoadingVisualization.swift
//  TV Guide
//
//  Created by Oleh Haistruk on 16.08.2020.
//  Copyright © 2020 Oleh Haistruk. All rights reserved.
//

import UIKit

class LoadingVisualization {
    
    var tableView: UITableView?
    let loadingIndicator = LoadingIndicator(style: .large)
    
    func runLoadingIndicator(scrollDirrection: Int) {
        DispatchQueue.main.async {

            guard let tableWidth = self.tableView?.frame.size.width, let tableHeight = self.tableView?.frame.size.height else {return}
            if scrollDirrection == -1 {
                self.loadingIndicator.center = CGPoint(x: tableWidth / 2, y: tableHeight / 2)
            } else if scrollDirrection == 1, let contentHeight = self.tableView?.contentSize.height {
                self.loadingIndicator.center = CGPoint(x: tableWidth / 2, y: contentHeight - (tableHeight / 2))
            }
            self.loadingIndicator.startAnimating()
            self.loadingIndicator.tag = 100
            self.tableView?.addSubview(self.loadingIndicator)
            self.tableView?.isUserInteractionEnabled = false
        }
    }
    
    func stopLoadingIndicator() {
        DispatchQueue.main.async {
            if let subviewIndicator = self.tableView?.viewWithTag(100) {
                subviewIndicator.removeFromSuperview()
                self.tableView?.isUserInteractionEnabled = true
            }
        }
    }
    
}
