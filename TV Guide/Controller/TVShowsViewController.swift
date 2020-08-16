//
//  TVShowsViewController.swift
//  TV Guide
//
//  Created by Oleh Haistruk on 15.08.2020.
//  Copyright © 2020 Oleh Haistruk. All rights reserved.
//

import UIKit

class TVShowsViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataModel: DataModel?
    var tableViewScrollPosition: TableViewScrollPosition?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        
        dataModel = DataModel(tableView: tableView)
        dataModel?.loadingVisualization.runLoadingIndicator()
        
        tableViewScrollPosition = TableViewScrollPosition(tableInitialOffsetPoint: true, dataModel: dataModel)
        
        tableView.register(TVShowsTableViewCell.self, forCellReuseIdentifier: "TVSowCell")
        tableView.rowHeight = 60
    }
    
}


extension TVShowsViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contenOffset = tableView.contentOffset.y
        let scrollDirection = tableView.panGestureRecognizer.velocity(in: tableView.superview).y
        tableViewScrollPosition?.dataLoadForTopOfTable(contentOffset: contenOffset, direction: scrollDirection)
    }
}

extension TVShowsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataModel = dataModel  else { return 0 }
        return dataModel.showItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVSowCell", for: indexPath) as! TVShowsTableViewCell
        cell.showName = dataModel?.showItems[indexPath.row].name
        
        cell.channelImageView.image = nil
        if let imageData = dataModel?.showItems[indexPath.row].imageData {
            let image = UIImage(data: imageData)
            cell.channelImage = image
        } else {
            dataModel?.loadImages(for: [indexPath])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableViewScrollPosition?.dataLoadForBottomOfTable(indexPath: indexPath)
    }
}

extension TVShowsViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        dataModel?.loadImages(for: indexPaths)
    }
    
    
}
