//
//  AppRowCell.swift
//  AppStor
//
//  Created by Yamadou Traore on 5/23/19.
//  Copyright © 2019 yamadou. All rights reserved.
//

import UIKit
import SDWebImage

class AppRowCell: UICollectionViewCell {
    
    let imageView    =  UIImageView(cornerRadius: 8)
    let nameLabel    =  UILabel(text: "App Name", font: .systemFont(ofSize: 20 ))
    let companyLabel =  UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    let getButton    =  UIButton(title: "GET")
    
    var app: FeedResult? {
        didSet {
            nameLabel.text = app?.name
            companyLabel.text = app?.artistName
            
            guard let url = URL(string: app?.artworkUrl100 ?? "") else { return }
            imageView.sd_setImage(with: url)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.layer.cornerRadius = 32 / 2
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        let labelsStackView = VerticalStackView(arrangedSubviews: [nameLabel, companyLabel], spacing: 4)
        
        let stackView = UIStackView(arrangedSubviews: [
            imageView, labelsStackView, getButton
        ])
        
        stackView.spacing = 16
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
