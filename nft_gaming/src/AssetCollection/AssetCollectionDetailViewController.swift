//
//  AssetCollectionDetailViewController.swift
//  nft_gaming
//
//  Created by Heriberto Prieto on 3/27/22.
//

import UIKit

class AssetCollectionDetailViewController: UIViewController {
    
    private let viewModel: AssetCollectionViewModel
    private var assetCollectionViewHeightConstraint: NSLayoutConstraint?
    
    // MARK: - Subviews
    
    private(set) lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var vStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var collectionHeaderView: AssetCollectionHeaderView = {
        AssetCollectionHeaderView(collection: viewModel.collection)
    }()
    
    @objc private(set) lazy var assetCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = false
        view.delegate = self
        view.dataSource = self
        view.register(AssetCollectionViewCell.self, forCellWithReuseIdentifier: AssetCollectionViewCell.reuseIdentifier)
        return view
    }()
    
    // MARK: - Init
    
    init(viewModel: AssetCollectionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.contentSize = CGSize(width: view.frame.width, height: 2000)
        
        scrollView.addSubview(vStackView)
        
        vStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        vStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -16).isActive = true
        vStackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        
        vStackView.addArrangedSubview(collectionHeaderView)
        vStackView.addArrangedSubview(assetCollectionView)
        
        assetCollectionViewHeightConstraint = assetCollectionView.heightAnchor.constraint(equalToConstant: 0)
        assetCollectionViewHeightConstraint?.isActive = true
        
        self.assetCollectionView.addObserver(self, forKeyPath: "contentSize", context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        self.assetCollectionViewHeightConstraint?.constant = self.assetCollectionView.contentSize.height
        scrollView.contentSize = CGSize(width: view.frame.width, height: self.assetCollectionView.contentSize.height + 625)
    }
    
    deinit {
        self.assetCollectionView.removeObserver(self, forKeyPath: "contentSize")
    }
    
}


extension AssetCollectionDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.assets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AssetCollectionViewCell.reuseIdentifier, for: indexPath) as! AssetCollectionViewCell
        let asset = viewModel.assets[indexPath.row]
        
        cell.imageUrlView.fetchImage(urlString: asset.imageUrl ?? "")
        cell.titleLabel.text = asset.name
        cell.subtitleLabel.text = asset.collection?.name
        
        cell.priceLabel += UIImage(systemName: "diamond.fill")
        cell.priceLabel += " "
        cell.priceLabel += .attributedString("0.45", font: .avenirNext(weight: .medium, size: 12), textColor: .gray)
        
        cell.likesLabel += UIImage(systemName: "heart")
        cell.likesLabel += " "
        cell.likesLabel += .attributedString("10", font: .avenirNext(weight: .medium, size: 12), textColor: .gray)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (view.frame.width / 2) - 16
        let cellHeight = cellWidth + 100
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let asset = viewModel.assets[indexPath.row]
        
        let controller = AssetDetailViewController()
        
        controller.collectionNameLabel.text = asset.collection?.name ?? ""
        controller.assetNameLabel.text = asset.name ?? ""
        if let imageUrl = asset.imageUrl {
            controller.imageView.fetchImage(urlString: imageUrl)
        }
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
