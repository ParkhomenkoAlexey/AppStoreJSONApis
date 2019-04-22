//
//  AppsHorizontalController.swift
//  AppStoreJSONApis
//
//  Created by Алексей Пархоменко on 20/04/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let topBottomPadding: CGFloat = 12
    static let leftRightPadding: CGFloat = 16
    static let lineSpacing: CGFloat = 10
}

class AppsHorizontalController: HorizontalSnappingController {
    
    var appGroup: AppGroup?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: AppRowCell.reuseid)
        collectionView.contentInset = .init(top: 0, left: Constants.leftRightPadding, bottom: 0, right: Constants.leftRightPadding)
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroup?.feed.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppRowCell.reuseid, for: indexPath) as! AppRowCell
        let app = appGroup?.feed.results[indexPath.item]
        cell.companyLabel.text = app?.artistName
        cell.nameLabel.text = app?.name
        cell.imageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: Constants.topBottomPadding, left: 0, bottom: Constants.topBottomPadding, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.lineSpacing
    }
    
    
}

extension AppsHorizontalController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * Constants.topBottomPadding - 2 * Constants.lineSpacing) / 3
        return .init(width: view.frame.width - 48, height: height)
    }
}
