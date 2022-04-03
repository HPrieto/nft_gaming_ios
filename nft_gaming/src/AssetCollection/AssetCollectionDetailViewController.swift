//
//  AssetCollectionDetailViewController.swift
//  nft_gaming
//
//  Created by Heriberto Prieto on 3/27/22.
//

import UIKit

class AssetCollectionDetailViewController: UIViewController {
    
    private let viewModel: AssetCollectionViewModel
    
    // MARK: - Subviews
    
    private(set) lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var hStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var collectionHeaderView: AssetCollectionHeaderView = {
        AssetCollectionHeaderView(collection: viewModel.collection)
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
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
        
        scrollView.addSubview(hStackView)
        
        hStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        hStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        hStackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        
        hStackView.addArrangedSubview(collectionHeaderView)
    }
    
}
