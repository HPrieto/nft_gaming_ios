//
//  AssetCollectionViewModel.swift
//  nft_gaming
//
//  Created by Heriberto Prieto on 3/27/22.
//

import UIKit

class AssetCollectionViewModel {
    
    var collection: OSAsset.OSAssetCollection
    var assets: [OSAsset]
    
    init(collection: OSAsset.OSAssetCollection) {
        self.collection = collection
        self.assets = Array(OSAssetsResponse.decentralandMockedData.assets[0 ..< 20])
    }
}
