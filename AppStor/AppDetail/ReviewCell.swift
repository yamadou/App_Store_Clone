//
//  ReviewCell.swift
//  AppStor
//
//  Created by Yamadou Traore on 5/31/19.
//  Copyright © 2019 yamadou. All rights reserved.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    let titleLabel  =  UILabel(text: "Review Title", font: .boldSystemFont(ofSize: 16))
    let authorLabel =  UILabel(text: "Author", font: .systemFont(ofSize: 16))
    let starsLabel  =  UILabel(text: "Stars", font: .systemFont(ofSize: 14))
    let bodyLabel   =  UILabel(text: "Review body\nReview body\nReview body\n",
                               font: .systemFont(ofSize: 14))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
