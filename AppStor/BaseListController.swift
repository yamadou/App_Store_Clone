//
//  BaseListController.swift
//  AppStor
//
//  Created by Yamadou Traore on 5/21/19.
//  Copyright © 2019 yamadou. All rights reserved.
//

import UIKit

class BaseListController: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
