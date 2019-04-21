//
//  AppRowCell.swift
//  AppStoreJSONApis
//
//  Created by Алексей Пархоменко on 21/04/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation
import UIKit

class AppRowCell: UICollectionViewCell {
    
    static let reuseid = "AppRowCell"
    
    let imageView = UIImageView(cornerRadius: 8)
    let nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    let getButton = UIButton(title: "GET")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayouts()
    }
    
    fileprivate func setupLayouts() {

        imageView.backgroundColor = .green
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainHeight(constant: 32)
        getButton.constrainWidth(constant: 80)
        getButton.layer.cornerRadius = 32 / 2
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        
        let stackView = UIStackView(arrangedSubviews: [imageView,
                                                       VerticalStackView(arrangedSubviews: [nameLabel, companyLabel], spacing: 4),
                                                       getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        addSubview(stackView)
        stackView.fillSuperview()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
