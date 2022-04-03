//
//  AssetCollectionsViewModel.swift
//  nft_gaming
//
//  Created by Heriberto Prieto on 3/27/22.
//

import Foundation

class AssetCollectionListViewModel {
    
    var collections: [OSAsset.OSAssetCollection] {
        OSAsset.OSAssetCollection.mockedData
    }
}
