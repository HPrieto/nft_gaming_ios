//
//  AssetDetailViewController.swift
//  nft_gaming
//
//  Created by Heriberto Prieto on 4/9/22.
//

import UIKit

class AssetDetailViewController: UIViewController {
    
    // MARK: - Subviews
    
    private(set) lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var vStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var collectionNameLabel: UILabel = {
        let view = UILabel()
        view.font = .avenirNext(weight: .medium, size: 18)
        view.textColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 2
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    private(set) lazy var assetNameLabel: UILabel = {
        let view = UILabel()
        view.font = .avenirNext(weight: .bold, size: 24)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 2
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
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
        
        vStackView.addArrangedSubview(imageView)
        vStackView.addArrangedSubview(collectionNameLabel)
        vStackView.addArrangedSubview(assetNameLabel)
        
        imageView.widthAnchor.constraint(equalTo: vStackView.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
