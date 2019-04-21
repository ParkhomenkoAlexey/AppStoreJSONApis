//
//  AppsHeaderHorizontalController.swift
//  AppStoreJSONApis
//
//  Created by Алексей Пархоменко on 21/04/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit

class AppsHeaderHorizontalController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(AppsHeaderControllerCell.self, forCellWithReuseIdentifier: AppsHeaderControllerCell.reuseId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsHeaderControllerCell.reuseId, for: indexPath) as! AppsHeaderControllerCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AppsHeaderHorizontalController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
}
