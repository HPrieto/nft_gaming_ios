//
//  AssetCollectionViewModel.swift
//  nft_gaming
//
//  Created by Heriberto Prieto on 3/27/22.
//

import UIKit

class AssetCollectionViewModel {
    
    var collection: OSAsset.OSAssetCollection
    
    init(collection: OSAsset.OSAssetCollection) {
        self.collection = collection
    }
}
