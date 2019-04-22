//
//  AppsHeaderHorizontalController.swift
//  AppStoreJSONApis
//
//  Created by Алексей Пархоменко on 21/04/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit

class AppsHeaderHorizontalController: HorizontalSnappingController {
    
    var socialApps = [SocialApp]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = .init(top: 0, left: Constants.leftRightPadding, bottom: 0, right: Constants.leftRightPadding)
        collectionView.register(AppsHeaderControllerCell.self, forCellWithReuseIdentifier: AppsHeaderControllerCell.reuseId)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialApps.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsHeaderControllerCell.reuseId, for: indexPath) as! AppsHeaderControllerCell
        let socialApp = socialApps[indexPath.item]
        cell.companyLabel.text = socialApp.name
        cell.textLabel.text = socialApp.tagline
        cell.imageView.sd_setImage(with: URL(string: socialApp.imageUrl))
        return cell
    }
    
}

extension AppsHeaderHorizontalController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
}
