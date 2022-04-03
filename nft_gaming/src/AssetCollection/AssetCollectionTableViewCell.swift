//
//  AssetCollectionTableViewCell.swift
//  nft_gaming
//
//  Created by Heriberto Prieto on 3/27/22.
//

import UIKit

class AssetCollectionTableViewCell: UITableViewCell {
    
    // MARK: - Subviews
    
    private(set) lazy var bannerImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.font = .avenirNext(weight: .medium, size: 18)
        view.numberOfLines = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        selectionStyle = .none
        
        contentView.addSubview(bannerImageView)
        contentView.addSubview(nameLabel)
        
        bannerImageView.layer.cornerRadius = 32
        bannerImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        bannerImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        bannerImageView.widthAnchor.constraint(equalTo: bannerImageView.heightAnchor).isActive = true
        bannerImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        
        nameLabel.centerYAnchor.constraint(equalTo: bannerImageView.centerYAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: bannerImageView.rightAnchor, constant: 8).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
    }
    
}
