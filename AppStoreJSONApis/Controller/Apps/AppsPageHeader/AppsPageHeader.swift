//
//  AppsPageHeader.swift
//  AppStoreJSONApis
//
//  Created by Алексей Пархоменко on 21/04/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    static let reuseId = "AppsPageHeader"
    
    let appHeaderHorizontalController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayouts()
    }
    
    fileprivate func setupLayouts() {
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
