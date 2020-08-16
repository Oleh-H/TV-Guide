//
//  LoadingIndicator.swift
//  TV Guide
//
//  Created by Oleh Haistruk on 16.08.2020.
//  Copyright © 2020 Oleh Haistruk. All rights reserved.
//

import UIKit

class LoadingIndicator: UIActivityIndicatorView {

    override init(style: UIActivityIndicatorView.Style) {
        super.init(style: style)
        self.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        self.hidesWhenStopped = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
