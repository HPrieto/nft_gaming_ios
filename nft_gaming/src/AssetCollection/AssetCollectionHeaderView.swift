//
//  AssetCollectionHeaderView.swift
//  nft_gaming
//
//  Created by Heriberto Prieto on 3/27/22.
//

import UIKit

class AssetCollectionHeaderView: UIView {
    
    public var collection: OSAsset.OSAssetCollection {
        didSet {
            reloadView()
        }
    }
    
    // MARK: - Subviews
    
    private(set) lazy var bannerImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 4
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.font = .avenirNext(weight: .bold, size: 32)
        view.numberOfLines = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 10
        view.font = .avenirNext(weight: .medium, size: 14)
        view.textColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    
    init(collection: OSAsset.OSAssetCollection) {
        self.collection = collection
        super.init(frame: .zero)
        reloadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(bannerImageView)
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        
        bannerImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bannerImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bannerImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bannerImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        imageView.layer.cornerRadius = 48
        imageView.centerYAnchor.constraint(equalTo: bannerImageView.bottomAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 96).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 24).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        
        bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16).isActive = true
    }
}

extension AssetCollectionHeaderView {
    
    func reloadView() {
        if let bannerImageUrlString = collection.bannerImageUrlString {
            bannerImageView.fetchImage(urlString: bannerImageUrlString)
        }
        
        if let imageUrlString = collection.imageUrlString {
            imageView.fetchImage(urlString: imageUrlString)
        }
        
        nameLabel.text = collection.name
        descriptionLabel.text = collection.description
    }
}
