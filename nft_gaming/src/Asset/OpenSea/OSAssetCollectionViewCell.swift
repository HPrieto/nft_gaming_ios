//
//  OSAssetCollectionViewCell.swift
//  nft_gaming
//
//  Created by Heriberto Prieto on 4/2/22.
//

import UIKit

class OSAssetCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Subviews
    
    private(set) lazy var 
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UICollectionViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
