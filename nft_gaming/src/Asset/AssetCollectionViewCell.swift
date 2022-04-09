//
//  AssetCollectionViewCell.swift
//  nft_gaming
//
//  Created by Heriberto Prieto on 4/2/22.
//

import UIKit

class AssetCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Subviews
    
    private(set) lazy var view: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor.placeholderText.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var imageUrlView: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var vStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.distribution = .equalSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = .avenirNext(weight: .semibold, size: 14)
        view.sizeToFit()
        view.numberOfLines = 1
        view.textColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var subtitleLabel: UILabel = {
        let view = UILabel()
        view.font = .avenirNext(weight: .semibold, size: 14)
        view.numberOfLines = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var hStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var priceLabel: UILabel = {
        let view = UILabel()
        view.font = .avenirNext(weight: .medium, size: 12)
        view.numberOfLines = 1
        view.textColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var likesLabel: UILabel = {
        let view = UILabel()
        view.font = .avenirNext(weight: .medium, size: 12)
        view.numberOfLines = 1
        view.textColor = .lightGray
        view.textAlignment = .right
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(view)
        
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        view.addSubview(imageUrlView)
        view.addSubview(vStackView)
        
        imageUrlView.topAnchor.constraint(equalTo: view.topAnchor, constant: 6).isActive = true
        imageUrlView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 6).isActive = true
        imageUrlView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -6).isActive = true
        imageUrlView.heightAnchor.constraint(equalTo: imageUrlView.widthAnchor).isActive = true
        
        vStackView.topAnchor.constraint(equalTo: imageUrlView.bottomAnchor, constant: 16).isActive = true
        vStackView.leftAnchor.constraint(equalTo: imageUrlView.leftAnchor, constant: 8).isActive = true
        vStackView.rightAnchor.constraint(equalTo: imageUrlView.rightAnchor, constant: -8).isActive = true
        vStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        
        vStackView.addArrangedSubview(titleLabel)
        vStackView.addArrangedSubview(subtitleLabel)
        vStackView.addArrangedSubview(hStackView)
        
        hStackView.widthAnchor.constraint(equalTo: vStackView.widthAnchor).isActive = true
        
        hStackView.addArrangedSubview(priceLabel)
        hStackView.addArrangedSubview(likesLabel)
    }
}

extension UICollectionViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
