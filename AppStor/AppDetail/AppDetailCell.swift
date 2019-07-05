//
//  AppDetailCell.swift
//  AppStor
//
//  Created by Yamadou Traore on 5/28/19.
//  Copyright © 2019 yamadou. All rights reserved.
//

import UIKit
import SDWebImage

class AppDetailCell: UICollectionViewCell {
    
    var app: Result? {
        didSet {
            nameLabel.text = app?.trackName
            releaseNotesLabel.text = app?.releaseNotes
            appIconImageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
            priceButton.setTitle(app?.formattedPrice, for: .normal)
        }
    }
    
    let appIconImageView  =  UIImageView(cornerRadius: 16)
    let priceButton       =  UIButton(title: "$4.99")
    let nameLabel         =  UILabel(text: "App Name", font: .boldSystemFont(ofSize: 24), numberOfLines: 2)
    let whatsNewLabel     =  UILabel(text: "What's News", font: .boldSystemFont(ofSize: 20))
    let releaseNotesLabel =  UILabel(text: "ReleaseNotes", font: .systemFont(ofSize: 18), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppIconImageView()
        setupPriceButton()
        
        let appIconAndNameStackView = UIStackView(arrangedSubviews: [
            appIconImageView,
            VerticalStackView(arrangedSubviews: [
                nameLabel,
                UIStackView(arrangedSubviews: [priceButton, UIView()]),
                UIView()
                ], spacing: 12)
            ], customSpacing: 20)
        
        let stackView = VerticalStackView(arrangedSubviews: [
            appIconAndNameStackView,
            whatsNewLabel,
            releaseNotesLabel
            ], spacing: 16)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    fileprivate func setupPriceButton() {
        priceButton.constrainWidth(constant: 80)
        priceButton.constrainHeight(constant: 32)
        priceButton.layer.cornerRadius = 32 / 2
        priceButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        priceButton.backgroundColor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1)
        priceButton.setTitleColor(.white, for: .normal)
    }
    
    fileprivate func setupAppIconImageView() {
        appIconImageView.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        appIconImageView.constrainWidth(constant: 140)
        appIconImageView.constrainHeight(constant: 140)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
