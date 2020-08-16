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
    
    func runLoadingIndicator() {
        DispatchQueue.main.async {
            guard let tableViewCenter = self.tableView?.center else { return }
//            debugPrint(tableViewCenter)
            self.loadingIndicator.startAnimating()
            self.loadingIndicator.tag = 100
            self.loadingIndicator.center = tableViewCenter
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
