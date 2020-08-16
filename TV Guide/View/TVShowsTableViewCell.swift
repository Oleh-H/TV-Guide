//
//  TVShowsTableViewCell.swift
//  TV Guide
//
//  Created by Oleh Haistruk on 12.08.2020.
//  Copyright © 2020 Oleh Haistruk. All rights reserved.
//

import UIKit

class TVShowsTableViewCell: UITableViewCell {

    var channelImage: UIImage?
    var showName: String?
 
    var showNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont(name: "System", size: 15)
        return label
    }()
    
    var channelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(channelImageView)
        self.addSubview(showNameLabel)
        
        channelImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        channelImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        channelImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        channelImageView.widthAnchor.constraint(equalToConstant: 65).isActive = true
        
        showNameLabel.leftAnchor.constraint(equalTo: self.channelImageView.rightAnchor, constant: 8).isActive = true
        showNameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        showNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        showNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let image = channelImage {
            self.channelImageView.image = image
        }
        if let name = showName  {
            self.showNameLabel.text = name
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
