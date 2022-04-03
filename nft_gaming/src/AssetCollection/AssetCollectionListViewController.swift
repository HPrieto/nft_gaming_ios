//
//  AssetCollectionListViewController.swift
//  nft_gaming
//
//  Created by Heriberto Prieto on 3/27/22.
//

import UIKit

class AssetCollectionListViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let viewModel: AssetCollectionListViewModel
    
    // MARK: - Subviews
    
    private(set) lazy var tableView: UITableView = {
        let view = UITableView(
            frame: .zero,
            style: .grouped
        )
        view.delegate = self
        view.dataSource = self
        view.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "header")
        view.register(AssetCollectionTableViewCell.self, forCellReuseIdentifier: AssetCollectionTableViewCell.reuseIdentifier)
        return view
    }()
    
    // MARK: - Init
    
    init(_ viewModel: AssetCollectionListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDelegate

extension AssetCollectionListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        header?.textLabel?.text = "Collection Results"
        header?.textLabel?.font = .avenirNext(weight: .semibold, size: 21)
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let collection = viewModel.collections[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: AssetCollectionTableViewCell.reuseIdentifier, for: indexPath) as! AssetCollectionTableViewCell
        if let imageUrlString = collection.imageUrlString {
            cell.bannerImageView.fetchImage(urlString: imageUrlString)
        }
        cell.nameLabel.text = collection.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let collection = viewModel.collections[indexPath.row]
        let viewModel = AssetCollectionViewModel(collection: collection)
        navigationController?.pushViewController(AssetCollectionDetailViewController(viewModel: viewModel), animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.collections.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        96
    }
}
