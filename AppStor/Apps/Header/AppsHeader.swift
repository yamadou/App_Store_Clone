//
//  AppsHeader.swift
//  AppStor
//
//  Created by Yamadou Traore on 5/23/19.
//  Copyright © 2019 yamadou. All rights reserved.
//

import UIKit

class AppsHeader: UICollectionReusableView {
    
    let appHeaderHorizontalController = AppHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
