//
//  Models+CoreData.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/21/22.
//

import Foundation
import CoreData

extension OSAssetMO: ManagedEntity { }
extension OSAssetCollectionMO: ManagedEntity { }
extension OSCollectionStatsMO: ManagedEntity { }
extension OSTraitMO: ManagedEntity { }
extension OSAssetContractMO: ManagedEntity { }
extension OSAccountMO: ManagedEntity { }
extension OSSellOrderMO: ManagedEntity { }
extension OSPaymentTokenMO: ManagedEntity { }
extension OSUserMO: ManagedEntity { }

extension Locale {
    static var backendDefault: Locale {
        return Locale(identifier: "en")
    }
    
    var shortIdentifier: String {
        return String(identifier.prefix(2))
    }
}

extension OSAsset {
    init?(managedObject: OSAssetMO) {
        guard
            let tokenId = managedObject.tokenId
        else { return nil }
        self.tokenId = tokenId
        self.numSales = managedObject.numSales
        self.imageUrl = managedObject.imageUrl
        self.imagePreviewUrl = managedObject.imagePreviewUrl
        self.imageThumbnailUrl = managedObject.imageThumbnailUrl
        self.isPresale = managedObject.isPresale
        self.animationUrl = managedObject.animationUrl
        self.animationOriginalUrl = managedObject.animationOriginalUrl
        self.backgroundColor = managedObject.backgroundColor
        self.name = managedObject.name
        self.description = managedObject.desc
        self.externalLink = managedObject.externalLink
        self.permalink = managedObject.permalink
        self.lastSale = managedObject.lastSale
        self.collection = OSAssetCollection(managedObject: managedObject.collection)
        if let managedTraits: [OSTrait] = managedObject.traits?.toArray(of: OSTraitMO.self).compactMap({ OSTrait(managedObject: $0) }) {
            self.traits = managedTraits
        }
        self.assetContract = OSAssetContract(managedObject: managedObject.assetContract)
        self.owner = OSAccount(managedObject: managedObject.owner)
        if let managedOrders = managedObject.sellOrders?.toArray(of: OSSellOrderMO.self).compactMap({ OSSellOrder(managedObject: $0) }) {
            self.sellOrders = managedOrders
        }
    }
    
    @discardableResult
    func store(in context: NSManagedObjectContext) -> OSAssetMO? {
        guard let asset = OSAssetMO.insertNew(in: context) else { return nil }
        asset.tokenId = tokenId
        asset.numSales = numSales ?? 0
        asset.imageUrl = imageUrl
        asset.imagePreviewUrl = imagePreviewUrl
        asset.imageThumbnailUrl = imageThumbnailUrl
        asset.imageOriginalUrl = imageOriginalUrl
        asset.isPresale = isPresale ?? false
        asset.animationUrl = animationUrl
        asset.animationOriginalUrl = animationOriginalUrl
        asset.backgroundColor = backgroundColor
        asset.name = name
        asset.desc = description
        asset.externalLink = externalLink
        asset.permalink = permalink
        asset.lastSale = lastSale ?? 0.0
        asset.collection = OSAssetCollectionMO.insertNew(in: context)
        if let traits = traits?.compactMap({ trait in
            OSTraitMO.insertNew(in: context)
        }) {
            asset.traits = NSSet(array: traits)
        }
        asset.assetContract = OSAssetContractMO.insertNew(in: context)
        asset.owner = OSAccountMO.insertNew(in: context)
        if let sellOrders = sellOrders?.compactMap({ sellOrder in
            OSSellOrderMO.insertNew(in: context)
        }) {
            asset.sellOrders = NSSet(array: sellOrders)
        }
        return asset
    }
}

extension OSAsset.OSAssetCollection {
    
    init?(managedObject: OSAssetCollectionMO?) {
        guard
            let managedObject = managedObject,
            let name = managedObject.name
        else {
            return nil
        }
        self.bannerImageUrlString = managedObject.bannerImageUrl
        self.description = managedObject.desc
        self.hidden = managedObject.hidden
        self.imageUrlString = managedObject.imageUrl
        self.largeImageUrlString = managedObject.largeImageUrl
        self.name = name
        self.paymentTokens = [OSAsset.OSPaymentToken]()
        self.featuredImageUrlString = managedObject.featuredImageUrl
        self.stats = OSAsset.OSAssetCollection.OSCollectionStats(managedObject: managedObject.stats)
    }
    
    @discardableResult
    func store(in context: NSManagedObjectContext) -> OSAssetCollectionMO? {
        guard let collection = OSAssetCollectionMO.insertNew(in: context) else { return nil }
        collection.bannerImageUrl = bannerImageUrlString
        collection.desc = description
        collection.hidden = hidden ?? false
        collection.imageUrl = imageUrlString
        collection.name = name
        return collection
    }
}

extension OSAsset.OSAssetCollection.OSCollectionStats {
    
    init?(managedObject: OSCollectionStatsMO?) {
        guard let managedObject = managedObject else {
            return nil
        }
        self.totalSupply = managedObject.totalSupply
        self.totalSales = managedObject.totalSales
        self.floorPrice = managedObject.floorPrice
        self.numOwners = managedObject.numOwners
        self.totalVolume = managedObject.totalVolume
        self.count = managedObject.count
    }
    
    @discardableResult
    func store(in context: NSManagedObjectContext) -> OSCollectionStatsMO? {
        guard let collection = OSCollectionStatsMO.insertNew(in: context) else { return nil }
        collection.totalSupply = totalSupply
        collection.totalSales = totalSales
        collection.floorPrice = floorPrice
        collection.numOwners = numOwners
        collection.totalVolume = totalVolume
        collection.count = count
        return collection
    }
}

extension OSAsset.OSTrait {
    
    init?(managedObject: OSTraitMO?) {
        guard let managedObject = managedObject else {
            return nil
        }
        self.traitType = managedObject.traitType
        self.value = managedObject.value
        self.displayType = managedObject.displayType
        self.traitCount = managedObject.traitCount
        self.maxValue = managedObject.maxValue
        self.order = managedObject.order
    }
    
    @discardableResult
    func store(in context: NSManagedObjectContext) -> OSTraitMO? {
        guard let trait = OSTraitMO.insertNew(in: context) else { return nil }
        trait.traitType = traitType
        trait.value = value
        trait.displayType = displayType
        trait.traitCount = traitCount ?? 0
        trait.maxValue = maxValue
        trait.order = order ?? 0
        return trait
    }
}

extension OSAsset.OSAssetContract {
    
    init?(managedObject: OSAssetContractMO?) {
        guard let managedObject = managedObject else {
            return nil
        }
        self.address = managedObject.address
        self.name = managedObject.name
        self.symbol = managedObject.symbol
        self.imageUrl = managedObject.imageUrl
        self.description = managedObject.desc
        self.externalLink = managedObject.externalLink
    }
    
    @discardableResult
    func store(in context: NSManagedObjectContext) -> OSAssetContractMO? {
        guard let contract = OSAssetContractMO.insertNew(in: context) else { return nil }
        contract.address = address
        contract.name = name
        contract.symbol = symbol
        contract.imageUrl = imageUrl
        contract.desc = description
        contract.externalLink = externalLink
        return contract
    }
}

extension OSAsset.OSAccount {
    
    init?(managedObject: OSAccountMO?) {
        guard let managedObject = managedObject else {
            return nil
        }
        self.address = managedObject.address
        self.profileImageUrl = managedObject.profileImageUrl
        self.user = OSUser(managedObject: managedObject.user)
        self.config = managedObject.config
    }
    
    @discardableResult
    func store(in context: NSManagedObjectContext) -> OSAccountMO? {
        guard let account = OSAccountMO.insertNew(in: context) else { return nil }
        account.address = address
        account.profileImageUrl = account.profileImageUrl
        account.user = OSUserMO.insertNew(in: context)
        account.config = config
        return account
    }
}

extension OSAsset.OSSellOrder {
    init?(managedObject: OSSellOrderMO?) {
        guard let managedObject = managedObject else {
            return nil
        }
        self.createdDate = managedObject.createdDate
        self.closingDate = managedObject.closingDate
        self.paymentTokenContract = OSAsset.OSPaymentToken(managedObject: managedObject.paymentTokenContract)
    }
    
    @discardableResult
    func store(in context: NSManagedObjectContext) -> OSSellOrderMO? {
        guard let sellOrder = OSSellOrderMO.insertNew(in: context) else { return nil }
        sellOrder.createdDate = createdDate
        sellOrder.closingDate = closingDate
        sellOrder.paymentTokenContract = OSPaymentTokenMO.insertNew(in: context)
        return sellOrder
    }
}

extension OSAsset.OSAccount.OSUser {
    
    init?(managedObject: OSUserMO?) {
        self.username = managedObject?.username
    }
    
    @discardableResult
    func store(in context: NSManagedObjectContext) -> OSUserMO? {
        guard let user = OSUserMO.insertNew(in: context) else { return nil }
        user.username = username
        return user
    }
}

extension OSAsset.OSPaymentToken {
    init?(managedObject: OSPaymentTokenMO?) {
        guard
            let managedObject = managedObject,
            let symbol = managedObject.symbol,
            let address = managedObject.address,
            let imageUrl = managedObject.imageUrl,
            let name = managedObject.name
        else {
            return nil
        }
        self.id = managedObject.id
        self.symbol = symbol
        self.address = address
        self.imageUrl = imageUrl
        self.name = name
        self.decimals = managedObject.decimals
        self.ethPrice = managedObject.ethPrice
        self.usdPrice = managedObject.usdPrice
    }
    
    @discardableResult
    func store(in context: NSManagedObjectContext) -> OSPaymentTokenMO? {
        guard
            let contract = OSPaymentTokenMO.insertNew(in: context)
        else {
            return nil
        }
        contract.id = id
        contract.symbol = symbol
        contract.address = address
        contract.imageUrl = imageUrl
        contract.name = name
        contract.decimals = decimals
        contract.ethPrice = ethPrice
        contract.usdPrice = usdPrice
        return contract
    }
}

