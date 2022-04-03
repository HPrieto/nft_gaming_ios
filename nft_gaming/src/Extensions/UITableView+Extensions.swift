//
//  UITableView+Extensions.swift
//  nft_gaming
//
//  Created by Heriberto Prieto on 3/27/22.
//

import UIKit

extension UITableViewCell {
    
    public static var reuseIdentifier: String {
        String(describing: self)
    }
}

extension UITableViewHeaderFooterView {
    
    public static var reuseIdentifier: String {
        String(describing: self)
    }
}
