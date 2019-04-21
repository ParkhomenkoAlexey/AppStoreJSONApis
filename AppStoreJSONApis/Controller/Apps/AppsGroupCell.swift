//
//  AppsCell.swift
//  AppStoreJSONApis
//
//  Created by Алексей Пархоменко on 20/04/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation
import UIKit


class AppsGroupCell: UICollectionViewCell {
    
    static let reuseId = "AppsCell"
    
    let titleLabel = UILabel(text: "App Section", font: UIFont.boldSystemFont(ofSize: 30))
    let horizontalController = AppsHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupElements()
    }
    
    fileprivate func setupElements() {
        addSubview(titleLabel)
        addSubview(horizontalController.view)
        
        // titleLabel constraints
        titleLabel.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          bottom: nil,
                          trailing: trailingAnchor,
                          padding: .init(top: 0, left: 16, bottom: 0, right: 0))

        // horizontalController constraints
        horizontalController.view.anchor(top: titleLabel.bottomAnchor,
                                         leading: leadingAnchor,
                                         bottom: bottomAnchor,
                                         trailing: trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
