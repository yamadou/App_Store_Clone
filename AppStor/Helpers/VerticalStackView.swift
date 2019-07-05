//
//  VerticalStackView.swift
//  AppStor
//
//  Created by Yamadou Traore on 5/19/19.
//  Copyright © 2019 yamadou. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        
        self.axis = .vertical
        self.spacing = spacing
        
        arrangedSubviews.forEach({addArrangedSubview($0)})
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
