//
//  OpenSeaAssetsInteractor.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/21/22.
//

import Combine
import Foundation
import SwiftUI

protocol OpenSeaAssetsInteractor {
    func loadCollection(collectionSlug: String) -> AnyPublisher<OSAsset.OSAssetCollection?, Error>
}

struct RealOpenSeaAssetsInteractor: OpenSeaAssetsInteractor {
    
    let webRepository: OpenSeaAssetsWebRepository
    
    init(webRepository: OpenSeaAssetsWebRepository) {
        self.webRepository = webRepository
    }
    
    func loadCollection(collectionSlug: String) -> AnyPublisher<OSAsset.OSAssetCollection?, Error> {
        return webRepository
            .loadCollection(collectionSlug: collectionSlug)
            .ensureTimeSpan(requestHoldBackTimeInterval)
            .compactMap { $0.collection }
            .eraseToAnyPublisher()
    }
    
    private func loadAndStoreCollectionFromWeb(collectionSlug: String) -> AnyPublisher<OSAsset.OSAssetCollection?, Error> {
        return webRepository
            .loadCollection(collectionSlug: collectionSlug)
            .ensureTimeSpan(requestHoldBackTimeInterval)
            .compactMap { $0.collection }
            .eraseToAnyPublisher()
    }
    
    private var requestHoldBackTimeInterval: TimeInterval {
        return ProcessInfo.processInfo.isRunningTests ? 0 : 0.5
    }
}

struct StubOpenSeaAssetsInteractor: OpenSeaAssetsInteractor {
    func loadCollection(collectionSlug: String) -> AnyPublisher<OSAsset.OSAssetCollection?, Error> {
        return Just<OSAsset.OSAssetCollection?>.withErrorType(nil, Error.self)
    }
    
    func loadCollection(collection: LoadableSubject<OSAsset.OSAssetCollection>, collectionSlug: String) { }
}
