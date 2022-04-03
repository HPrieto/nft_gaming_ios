//
//  MockedData.swift
//  marketa
//
//  Created by Heriberto Prieto on 3/7/22.
//

import Foundation

#if DEBUG

extension OSAsset.OSAssetCollection {
    
    static let mockedData: [OSAsset.OSAssetCollection] = [
        OSAsset.OSAssetCollection(
            paymentTokens: OSAsset.OSPaymentToken.mockedData,
            bannerImageUrlString: "https://storage.opensea.io/static/banners/dclwearables-banner.png",
            description: "Decentraland is an Ethereum blockchain-powered virtual world, developed and owned by its users, who can create, experience, and monetize content and applications. Join a growing community of virtual world inhabitants who are building the world's largest alternate reality economy on the blockchain. In this store, you can buy and sell land assets in MANA, DCL's native currency.",
            imageUrlString: "https://lh3.googleusercontent.com/5KIxEGmnAiL5psnMCSLPlfSxDxfRSk4sTQRSyhPdgnu70nGb2YsuVxTmO2iKEkOZOfq476Bl1hAu6aJIKjs1myY=s60",
            largeImageUrlString: "https://lh3.googleusercontent.com/ZIOoCXJlOBaaY79prMWkQQ05odBTbkpg8A30EEO919lQbhCw9fv0kMf3QK1EMmz0cdS4-KWAUVWPtjz3ca_F2pkyD6v7AJre4tLjwA=s300",
            name: "Decentraland",
            stats: OSAsset.OSAssetCollection.OSCollectionStats(
                totalVolume: 156153.40511882017,
                totalSales: 82549.0,
                totalSupply: 168104.0,
                count: 168104.0,
                numOwners: 20317,
                floorPrice: 2.85
            )
        ),
        OSAsset.OSAssetCollection(
            paymentTokens: OSAsset.OSPaymentToken.mockedData,
            bannerImageUrlString: "https://lh3.googleusercontent.com/4NQIRoGmzXeXQN4mjuhWuuDZSNW7_BqRXux5upd4Nn_A-bfsGxCnPF8qn98Y6MyHRDPGXIlgfZADcSOe6M2DyrDKXdbdaTgkZN5l=s2500",
            description: "Sandbox LAND is currently undergoing a migration to a new contract. In order to benefit from all future LAND features, please migrate to the new contract. How to do it and to learn more, please visit: [https://www.sandbox.game/en/me/migration/](https://www.sandbox.game/en/me/migration/)\r\n\r\n---\r\n\r\nThe Sandbox is a community-driven platform where creators can monetize voxel assets and gaming experiences on the blockchain. The Sandbox metaverse comprises a map made up of 166,464 LANDS.  LAND owners can host contests and events, stake SAND to earn and customize assets, monetize assets and experiences, vote in the metaverse governance, play games that you or others create, and more! Trade the collection and keep your eyes peeled for future drops.",
            imageUrlString: "https://lh3.googleusercontent.com/SXH8tW1siikB80rwCRnjm1a5xM_MwTg9Xl9Db6mioIk9HIlDM09pVoSR7GKJgS6ulSUpgW9BDtMk_ePX_NKgO9A=s60",
            largeImageUrlString: "https://lh3.googleusercontent.com/SXH8tW1siikB80rwCRnjm1a5xM_MwTg9Xl9Db6mioIk9HIlDM09pVoSR7GKJgS6ulSUpgW9BDtMk_ePX_NKgO9A",
            name: "The Sandbox",
            stats: OSAsset.OSAssetCollection.OSCollectionStats(
                totalVolume: 156153.40511882017,
                totalSales: 82549.0,
                totalSupply: 168104.0,
                count: 168104.0,
                numOwners: 20317,
                floorPrice: 2.85
            )
        ),
        OSAsset.OSAssetCollection(
            paymentTokens: OSAsset.OSPaymentToken.mockedData,
            bannerImageUrlString: "https://lh3.googleusercontent.com/4NQIRoGmzXeXQN4mjuhWuuDZSNW7_BqRXux5upd4Nn_A-bfsGxCnPF8qn98Y6MyHRDPGXIlgfZADcSOe6M2DyrDKXdbdaTgkZN5l=s2500",
            description: "The Sandbox is a community-driven platform where creators can monetize voxel assets and gaming experiences on the blockchain. The Sandbox metaverse comprises a map made up of 166,464 LANDS.  LAND owners can host contests and events, stake SAND to earn and customize assets, monetize assets and experiences, vote in the metaverse governance, play games that you or others create, and more! Trade the collection and keep your eyes peeled for future drops.",
            imageUrlString: "https://lh3.googleusercontent.com/SXH8tW1siikB80rwCRnjm1a5xM_MwTg9Xl9Db6mioIk9HIlDM09pVoSR7GKJgS6ulSUpgW9BDtMk_ePX_NKgO9A=s60",
            largeImageUrlString: "https://storage.googleapis.com/opensea-static/featured-images/sandbox-featured.png",
            name: "Sandbox's ASSETs",
            stats: OSAsset.OSAssetCollection.OSCollectionStats(
                totalVolume: 156153.40511882017,
                totalSales: 82549.0,
                totalSupply: 168104.0,
                count: 168104.0,
                numOwners: 20317,
                floorPrice: 2.85
            )
        )
    ]
    
}

extension OSAsset.OSPaymentToken {
    
    static let mockedData: [OSAsset.OSPaymentToken] = [
        OSAsset.OSPaymentToken(
            id: 4403908,
            symbol: "USDC",
            address: "0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48",
            imageUrl: "https://storage.opensea.io/files/749015f009a66abcb3bbb3502ae2f1ce.svg",
            name: "USD Coin",
            decimals: 6,
            ethPrice: 0.00039137,
            usdPrice: 0.999783
        ),
        OSAsset.OSPaymentToken(
            id: 4645681,
            symbol: "WETH",
            address: "0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2",
            imageUrl: "https://storage.opensea.io/files/accae6b6fb3888cbff27a013729c22dc.svg",
            name: "Wrapped Ether",
            decimals: 18,
            ethPrice: 1.0,
            usdPrice: 2550.83
        ),
        OSAsset.OSPaymentToken(
            id: 16085533,
            symbol: "WBTC",
            address: "0x2260fac5e5542a773aa44fbcfedf7c193bc2c599",
            imageUrl: "https://lh3.googleusercontent.com/c27cOa6AQ2-KlTy7VISxxc8kz09IGQYNT6OcozqKTtDvfFqnJ7GN27OxFkICDqhuu9Kls3S5r-48QefBw7AMBKkryw=s120",
            name: "Wrapped BTC",
            decimals: 8,
            ethPrice: 32.344111939762165,
            usdPrice: 38722.0
        )
    ]
}

#endif
