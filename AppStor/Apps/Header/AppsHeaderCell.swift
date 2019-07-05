//
//  AppsHeaderCell.swift
//  AppStor
//
//  Created by Yamadou Traore on 5/23/19.
//  Copyright © 2019 yamadou. All rights reserved.
//

import  UIKit

class  AppsHeaderCell: UICollectionViewCell {
    
    let imageView    = UIImageView(cornerRadius: 8)
    let companyLabel = UILabel(text: "Facebook", font: UIFont.boldSystemFont(ofSize: 14))
    let titleLabel   = UILabel(text: "Keeping up with friends is faster than ever", font: UIFont.systemFont(ofSize: 24))
    
    var app: SocialApp? {
        didSet {
            titleLabel.text = self.app?.tagline
            companyLabel.text = self.app?.name
            
            if let url = URL(string: self.app?.imageUrl ?? "") {
                imageView.sd_setImage(with: url)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        companyLabel.textColor = .blue
        imageView.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        titleLabel.numberOfLines = 2
        
        let stackView = VerticalStackView(arrangedSubviews: [
            companyLabel, titleLabel, imageView
        ], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
