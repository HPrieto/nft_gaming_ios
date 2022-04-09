//
//  Models.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/18/22.
//

import UIKit

// MARK: - Response Models

struct OSAssetsResponse: Codable {
    var next: String?
    var previous: String?
    var assets: [OSAsset] = [OSAsset]()
}

// MARK: OSAsset

struct OSAsset: Codable {
    public var tokenId: String
    public var numSales: Int32?
    public var imageUrl: String?
    public var imagePreviewUrl: String?
    public var imageThumbnailUrl: String?
    public var imageOriginalUrl: String?
    public var isPresale: Bool?
    public var animationUrl: String?
    public var animationOriginalUrl: String?
    public var backgroundColor: String?
    public var name: String?
    public var description: String?
    public var externalLink: String?
    public var permalink: String?
    public var lastSale: LastSale?
    public var collection: OSAssetCollection?
    public var traits: [OSTrait]?
    public var assetContract: OSAssetContract?
    public var owner: OSAccount?
    public var sellOrders: [OSSellOrder]?
    
    private enum CodingKeys: String, CodingKey {
        case tokenId = "token_id"
        case numSales = "num_sales"
        case imageUrl = "image_url"
        case imagePreviewUrl = "image_preview_url"
        case imageThumbnailUrl = "image_thumbnail_url"
        case imageOriginalUrl = "image_original_url"
        case isPresale = "is_presale"
        case animationUrl = "animation_url"
        case animationOriginalUrl = "animation_original_url"
        case backgroundColor = "background_color"
        case name = "name"
        case description = "description"
        case externalLink = "external_link"
        case assetContract = "asset_contract"
        case owner = "owner"
        case permalink = "permalink"
        case traits = "traits"
        case lastSale = "last_sale"
        case collection = "collection"
        case sellOrders = "sell_orders"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            tokenId = try String(container.decode(Int32.self, forKey: .tokenId))
        } catch DecodingError.typeMismatch {
            tokenId = try container.decode(String.self, forKey: .tokenId)
        }
        numSales = try container.decodeIfPresent(Int32.self, forKey: .numSales)
        imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
        imagePreviewUrl = try container.decodeIfPresent(String.self, forKey: .imagePreviewUrl)
        imageThumbnailUrl = try container.decodeIfPresent(String.self, forKey: .imageThumbnailUrl)
        imageOriginalUrl = try container.decodeIfPresent(String.self, forKey: .imageOriginalUrl)
        isPresale = try container.decodeIfPresent(Bool.self, forKey: .isPresale)
        animationUrl = try container.decodeIfPresent(String.self, forKey: .animationUrl)
        animationOriginalUrl = try container.decodeIfPresent(String.self, forKey: .animationOriginalUrl)
        backgroundColor = try container.decodeIfPresent(String.self, forKey: .backgroundColor)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        externalLink = try container.decodeIfPresent(String.self, forKey: .externalLink)
        assetContract = try container.decodeIfPresent(OSAssetContract.self, forKey: .assetContract)
        owner = try container.decodeIfPresent(OSAccount.self, forKey: .owner)
        permalink = try container.decodeIfPresent(String.self, forKey: .permalink)
        traits = try container.decodeIfPresent([OSTrait].self, forKey: .traits)
        lastSale = try container.decodeIfPresent(LastSale.self, forKey: .lastSale)
        collection = try container.decodeIfPresent(OSAssetCollection.self, forKey: .collection)
        sellOrders = try container.decodeIfPresent([OSSellOrder].self, forKey: .sellOrders)
    }
    
    init(tokenId: String,
         imageUrl: String? = nil,
         imageThumbnailUrl: String? = nil,
         name: String? = nil,
         description: String? = nil,
         collection: OSAsset.OSAssetCollection? = nil,
         traits: [OSAsset.OSTrait] = [OSAsset.OSTrait](),
         assetContract: OSAsset.OSAssetContract? = nil,
         owner: OSAsset.OSAccount? = nil
    ) {
        self.tokenId = tokenId
        self.imageUrl = imageUrl
        self.imageThumbnailUrl = imageThumbnailUrl
        self.name = name
        self.description = description
        self.collection = collection
        self.traits = traits
        self.assetContract = assetContract
        self.owner = owner
    }
}

// MARK: - OSAssetCollection

extension OSAsset {

    struct OSAssetCollection: Codable, Equatable {
        public let paymentTokens: [OSAsset.OSPaymentToken]
        public let bannerImageUrlString: String?
        public let description: String?
        public let hidden: Bool?
        public let imageUrlString: String?
        public let largeImageUrlString: String?
        public let name: String
        public let featuredImageUrlString: String?
        public let stats: OSAsset.OSAssetCollection.OSCollectionStats?
        
        public var imageUrl: URL? {
            URL(string: self.imageUrlString ?? "")
        }

        public var largeImageUrl: URL? {
            URL(string: self.largeImageUrlString ?? "")
        }

        public var bannerImageUrl: URL? {
            URL(string: self.bannerImageUrlString ?? "")
        }
        
        public var featuredImageUrl: URL? {
            URL(string: self.featuredImageUrlString ?? "")
        }
        
        private enum CodingKeys: String, CodingKey {
            case paymentTokens = "payment_tokens"
            case bannerImageUrlString = "banner_image_url"
            case description = "description"
            case hidden = "hidden"
            case imageUrlString = "image_url"
            case largeImageUrlString = "large_image_url"
            case name = "name"
            case featuredImageUrlString = "featured_image_url"
            case stats = "stats"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            paymentTokens = try container.decodeIfPresent([OSAsset.OSPaymentToken].self, forKey: .paymentTokens) ?? [OSAsset.OSPaymentToken]()
            bannerImageUrlString = try container.decodeIfPresent(String.self, forKey: .bannerImageUrlString)
            description = try container.decodeIfPresent(String.self, forKey: .description)
            hidden = try container.decodeIfPresent(Bool.self, forKey: .hidden)
            imageUrlString = try container.decodeIfPresent(String.self, forKey: .imageUrlString)
            largeImageUrlString = try container.decodeIfPresent(String.self, forKey: .largeImageUrlString)
            name = try container.decode(String.self, forKey: .name)
            featuredImageUrlString = try container.decodeIfPresent(String.self, forKey: .featuredImageUrlString)
            stats = try container.decodeIfPresent(OSCollectionStats.self, forKey: .stats)
        }
        
        init(paymentTokens: [OSAsset.OSPaymentToken],
             bannerImageUrlString: String,
             description: String,
             imageUrlString: String,
             largeImageUrlString: String,
             name: String,
             hidden: Bool = false,
             featuredImageUrlString: String? = nil,
             stats: OSCollectionStats? = nil
        ) {
            self.paymentTokens = paymentTokens
            self.bannerImageUrlString = bannerImageUrlString
            self.description = description
            self.imageUrlString = imageUrlString
            self.largeImageUrlString = largeImageUrlString
            self.name = name
            self.hidden = hidden
            self.featuredImageUrlString = featuredImageUrlString
            self.stats = stats
        }
    }
}

// MARK: - LastSale

extension OSAsset {
    struct LastSale: Codable {
        var asset: Asset
        var eventType: String
        var eventTimestamp: Date
        var auctionType: String
        var totalPrice: String
        var paymentToken: PaymentToken
        var transaction: Transaction
        var createdDate: Date
        var quantity: String
        
        private enum CodingKeys: String, CodingKey {
            case asset = "asset"
            case eventType = "event_type"
            case eventTimestamp = "event_timestamp"
            case auctionType = "auction_type"
            case totalPrice = "total_price"
            case paymentToken = "payment_token"
            case transaction = "transaction"
            case createdDate = "created_date"
            case quantity = "quantity"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            
            self.asset = try container.decode(Asset.self, forKey: .asset)
            self.eventType = try container.decode(String.self, forKey: .eventType)
            let eventTimestampStr: String = try container.decode(String.self, forKey: .eventTimestamp)
            if let eventTimestamp = dateFormatter.date(from: eventTimestampStr) {
                self.eventTimestamp = eventTimestamp
            } else {
                self.eventTimestamp = Date()
            }
            self.auctionType = try container.decode(String.self, forKey: .auctionType)
            self.totalPrice = try container.decode(String.self, forKey: .totalPrice)
            self.paymentToken = try container.decode(PaymentToken.self, forKey: .paymentToken)
            self.transaction = try container.decode(LastSale.Transaction.self, forKey: .transaction)
            let createdDateStr: String = try container.decode(String.self, forKey: .createdDate)
            if let createdDate = dateFormatter.date(from: createdDateStr) {
                self.createdDate = createdDate
            } else {
                self.createdDate = Date()
            }
            self.quantity = try container.decode(String.self, forKey: .quantity)
        }
    }
}

extension OSAsset.LastSale {
    struct PaymentToken: Codable {
        var symbol: String
        var address: String
        var imageUrl: String
        var name: String
        var decimals: Int32
        var ethPrice: String
        var usdPrice: String
        
        private enum CodingKeys: String, CodingKey {
            case symbol = "symbol"
            case address = "address"
            case imageUrl = "image_url"
            case name = "name"
            case decimals = "decimals"
            case ethPrice = "eth_price"
            case usdPrice = "usd_price"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.symbol = try container.decode(String.self, forKey: .symbol)
            self.address = try container.decode(String.self, forKey: .address)
            self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
            self.name = try container.decode(String.self, forKey: .name)
            self.decimals = try container.decode(Int32.self, forKey: .decimals)
            self.ethPrice = try container.decode(String.self, forKey: .ethPrice)
            self.usdPrice = try container.decode(String.self, forKey: .usdPrice)
        }
    }
}

extension OSAsset.LastSale {
    struct Asset: Codable {
        var decimals: Int
        var tokenId: String
        
        private enum CodingKeys: String, CodingKey {
            case decimals = "decimals"
            case tokenId = "token_id"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.decimals = try container.decode(Int.self, forKey: .decimals)
            self.tokenId = try container.decode(String.self, forKey: .tokenId)
        }
    }
    
    struct Transaction: Codable {
        var blockHash: String
        var blockNumber: String
        var fromAccount: Account
        var id: Int32
        var timestamp: Date
        var toAccount: Account
        var transactionHash: String
        var transactionIndex: String
        
        private enum CodingKeys: String, CodingKey {
            case blockHash = "block_hash"
            case blockNumber = "block_number"
            case fromAccount = "from_account"
            case id = "id"
            case timestamp = "timestamp"
            case toAccount = "to_account"
            case transactionHash = "transaction_hash"
            case transactionIndex = "transaction_index"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            
            self.blockHash = try container.decode(String.self, forKey: .blockHash)
            self.blockNumber = try container.decode(String.self, forKey: .blockNumber)
            self.fromAccount = try container.decode(Account.self, forKey: .fromAccount)
            self.id = try container.decode(Int32.self, forKey: .id)
            let timestampStr: String = try container.decode(String.self, forKey: .timestamp)
            if let timestamp = dateFormatter.date(from: timestampStr) {
                self.timestamp = timestamp
            } else {
                self.timestamp = Date()
            }
            self.toAccount = try container.decode(Account.self, forKey: .toAccount)
            self.transactionHash = try container.decode(String.self, forKey: .transactionHash)
            self.transactionIndex = try container.decode(String.self, forKey: .transactionIndex)
        }
    }
}

extension OSAsset.LastSale.Transaction {
    struct Account: Codable {
        var user: User?
        var profileImageUrl: String?
        var address: String?
        var config: String?
        
        private enum CodingKeys: String, CodingKey {
            case user = "user"
            case profileImageUrl = "profile_image_url"
            case address = "address"
            case config = "config"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.user = try container.decodeIfPresent(User.self, forKey: .user)
            self.profileImageUrl = try container.decodeIfPresent(String.self, forKey: .profileImageUrl)
            self.address = try container.decodeIfPresent(String.self, forKey: .address)
            self.config = try container.decodeIfPresent(String.self, forKey: .config)
        }
    }
}

extension OSAsset.LastSale.Transaction.Account {
    struct User: Codable {
        var username: String?
    }
}

// MARK: - OSCollectionStats

/*
 
"one_day_volume": 181.94094150973604,
"one_day_change": -0.3714621145893069,
"one_day_sales": 57.0,
"one_day_average_price": 3.1919463422760708,
"seven_day_volume": 1780.9127400911261,
"seven_day_change": -0.23036360779067494,
"seven_day_sales": 519.0,
"seven_day_average_price": 3.431431098441476,
"thirty_day_volume": 10249.26417217667,
"thirty_day_change": -0.48362947704410036,
"thirty_day_sales": 2704.0,
"thirty_day_average_price": 3.790408347698473,
"total_volume": 156153.40511882017,
"total_sales": 82549.0,
"total_supply": 168104.0,
"count": 168104.0,
"num_owners": 20317,
"average_price": 1.8916450243954521,
"num_reports": 9,
"market_cap": 576837.2933724059,
"floor_price": 2.85
 
 */

extension OSAsset.OSAssetCollection {
    struct OSCollectionStats: Codable, Equatable {
        let totalVolume: Double
        let totalSales: Double
        let totalSupply: Double
        let count: Double
        let numOwners: Int32
        let floorPrice: Float
        
        private enum CodingKeys: String, CodingKey {
            case totalVolume = "total_volume"
            case totalSales = "total_sales"
            case totalSupply = "total_supply"
            case count = "count"
            case numOwners = "num_owners"
            case floorPrice = "floor_price"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            totalVolume = try container.decodeIfPresent(Double.self, forKey: .totalVolume) ?? 0.0
            totalSales = try container.decodeIfPresent(Double.self, forKey: .totalSales) ?? 0.00
            totalSupply = try container.decodeIfPresent(Double.self, forKey: .totalSupply) ?? 0.0
            count = try container.decodeIfPresent(Double.self, forKey: .count) ?? 0.0
            numOwners = try container.decodeIfPresent(Int32.self, forKey: .numOwners) ?? 0
            floorPrice = try container.decodeIfPresent(Float.self, forKey: .floorPrice) ?? 0.0
        }
        
        init(
            totalVolume: Double,
            totalSales: Double,
            totalSupply: Double,
            count: Double,
            numOwners: Int32,
            floorPrice: Float
        ) {
            self.totalVolume = totalVolume
            self.totalSales = totalSales
            self.totalSupply = totalSupply
            self.count = count
            self.numOwners = numOwners
            self.floorPrice = floorPrice
        }
    }
}

// MARK: - OSPaymentToken

extension OSAsset {
    struct OSPaymentToken: Codable, Equatable {
        public var id: Int32
        public var symbol: String
        public var address: String
        public var imageUrl: String
        public var name: String
        public var decimals: Int32
        public var ethPrice: Float
        public var usdPrice: Float
        
        private enum CodingKeys: String, CodingKey {
            case id = "id"
            case symbol = "symbol"
            case address = "address"
            case imageUrl = "image_url"
            case name = "name"
            case decimals = "decimals"
            case ethPrice = "eth_price"
            case usdPrice = "usd_price"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(Int32.self, forKey: .id)
            symbol = try container.decode(String.self, forKey: .symbol)
            address = try container.decode(String.self, forKey: .address)
            imageUrl = try container.decode(String.self, forKey: .imageUrl)
            name = try container.decode(String.self, forKey: .name)
            decimals = try container.decode(Int32.self, forKey: .decimals)
            ethPrice = try container.decode(Float.self, forKey: .ethPrice)
            usdPrice = try container.decode(Float.self, forKey: .usdPrice)
        }
        
        init(id: Int32,
             symbol: String,
             address: String,
             imageUrl: String,
             name: String,
             decimals: Int32,
             ethPrice: Float,
             usdPrice: Float) {
            self.id = id
            self.symbol = symbol
            self.address = address
            self.imageUrl = imageUrl
            self.name = name
            self.decimals = decimals
            self.ethPrice = ethPrice
            self.usdPrice = usdPrice
        }
    }
}

// MARK: - OSTrait

extension OSAsset {
    
    struct OSTrait: Codable {
        public var traitType: String?
        public var value: String?
        public var displayType: String?
        public var traitCount: Int32?
        public var maxValue: String?
        public var order: Int32?
        
        private enum CodingKeys: String, CodingKey {
            case traitType = "trait_type"
            case value = "value"
            case displayType = "display_type"
            case traitCount = "trait_count"
            case maxValue = "max_value"
            case order = "order"
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            traitType = try container.decodeIfPresent(String.self, forKey: .traitType)
            do {
                value = try String(container.decode(Int32.self, forKey: .value))
            } catch DecodingError.typeMismatch {
                value = try container.decodeIfPresent(String.self, forKey: .value)
            }
            displayType = try container.decodeIfPresent(String.self, forKey: .displayType)
            traitCount = try container.decodeIfPresent(Int32.self, forKey: .traitCount)
            maxValue = try container.decodeIfPresent(String.self, forKey: .maxValue)
            order = try container.decodeIfPresent(Int32.self, forKey: .order)
        }
    }
}

// MARK: - OSAssetContract

extension OSAsset {
    
    struct OSAssetContract: Codable {
        public var address: String?
        public var name: String?
        public var symbol: String?
        public var imageUrl: String?
        public var description: String?
        public var externalLink: String?
        
        private enum CodingKeys: String, CodingKey {
            case address = "address"
            case name = "name"
            case symbol = "symbol"
            case imageUrl = "image_url"
            case description = "description"
            case externalLink = "external_link"
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            address = try container.decodeIfPresent(String.self, forKey: .address)
            name = try container.decodeIfPresent(String.self, forKey: .name)
            symbol = try container.decodeIfPresent(String.self, forKey: .symbol)
            imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
            description = try container.decodeIfPresent(String.self, forKey: .description)
            externalLink = try container.decodeIfPresent(String.self, forKey: .externalLink)
        }
    }
}

// MARK: - OSAccount

extension OSAsset {
    
    struct OSAccount: Codable {
        public var address: String?
        public var profileImageUrl: String?
        public var user: OSUser?
        public var config: String?
        
        private enum CodingKeys: String, CodingKey {
            case address = "address"
            case profileImageUrl = "profile_img_url"
            case user = "user"
            case config = "config"
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            address = try container.decodeIfPresent(String.self, forKey: .address)
            profileImageUrl = try container.decodeIfPresent(String.self, forKey: .profileImageUrl)
            user = try container.decodeIfPresent(OSUser.self, forKey: .user)
            config = try container.decodeIfPresent(String.self, forKey: .config)
        }
    }
}

// MARK: - OSSellOrder

extension OSAsset {
    
    struct OSSellOrder: Codable {
        public var createdDate: String?
        public var closingDate: String?
        public var closingExtendable: Bool?
        public var expirationTime: Double?
        public var listingTime: Double?
        public var orderHash: String?
        public var exchange: String?
        public var currentPrice: String?
        public var currentBounty: String?
        public var bountyMultiple: String?
        public var makerRelayerFee: String?
        public var makerProtocolFee: String?
        public var takerProtocolFee: String?
        public var makerReferrerFee: String?
        public var feeMethod: Int?
        public var side: Int?
        public var saleKind: Int?
        public var target: String?
        public var howToCall: Int?
        public var callData: String?
        public var replacementPattern: String?
        public var staticTarget: String?
        public var staticExtradata: String?
        public var paymentToken: String?
        public var basePrice: String?
        public var extra: String?
        public var quantity: String?
        public var salt: String?
        public var v: Int?
        public var r: String?
        public var s: String?
        public var approvedOnChain: Bool?
        public var cancelled: Bool?
        public var finalized: Bool?
        public var markedInvalid: Bool?
        public var prefixedHash: String?
        public var paymentTokenContract: OSAsset.OSPaymentToken?

        private enum CodingKeys: String, CodingKey {
            case createdDate = "created_date"
            case closingDate = "closing_date"
            case closingExtendable = "closingExtendable"
            case expirationTime = "expiration_time"
            case listingTime = "listing_time"
            case orderHash = "order_hash"
            case exchange = "exchange"
            case currentPrice = "current_price"
            case currentBounty = "current_bounty"
            case bountyMultiple = "bounty_multiple"
            case makerRelayerFee = "maker_relayer_fee"
            case makerProtocolFee = "maker_protocol_fee"
            case takerProtocolFee = "taker_protocol_fee"
            case makerReferrerFee = "maker_referrer_fee"
            case feeMethod = "fee_method"
            case side = "side"
            case saleKind = "sale_kind"
            case target = "target"
            case howToCall = "how_to_call"
            case callData = "call_data"
            case replacementPattern = "replacement_pattern"
            case staticTarget = "static_target"
            case staticExtradata = "static_extradata"
            case paymentToken = "payment_token"
            case basePrice = "base_price"
            case extra = "extra"
            case quantity = "quantity"
            case salt = "salt"
            case v = "v"
            case r = "r"
            case s = "s"
            case approvedOnChain = "approved_on_chain"
            case cancelled = "cancelled"
            case finalized = "finalized"
            case markedInvalid = "marked_invalid"
            case prefixedHash = "prefixed_hash"
            case paymentTokenContract = "payment_token_contract"
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            createdDate = try container.decodeIfPresent(String.self, forKey: .createdDate)
            closingDate = try container.decodeIfPresent(String.self, forKey: .closingDate)
            closingExtendable = try container.decodeIfPresent(Bool.self, forKey: .closingExtendable)
            expirationTime = try container.decodeIfPresent(Double.self, forKey: .expirationTime)
            listingTime = try container.decodeIfPresent(Double.self, forKey: .listingTime)
            orderHash = try container.decodeIfPresent(String.self, forKey: .orderHash)
            exchange = try container.decodeIfPresent(String.self, forKey: .exchange)
            currentPrice = try container.decodeIfPresent(String.self, forKey: .currentPrice)
            currentBounty = try container.decodeIfPresent(String.self, forKey: .currentBounty)
            bountyMultiple = try container.decodeIfPresent(String.self, forKey: .bountyMultiple)
            makerRelayerFee = try container.decodeIfPresent(String.self, forKey: .makerRelayerFee)
            feeMethod = try container.decodeIfPresent(Int.self, forKey: .feeMethod)
            side = try container.decodeIfPresent(Int.self, forKey: .side)
            saleKind = try container.decodeIfPresent(Int.self, forKey: .saleKind)
            target = try container.decodeIfPresent(String.self, forKey: .target)
            howToCall = try container.decodeIfPresent(Int.self, forKey: .howToCall)
            callData = try container.decodeIfPresent(String.self, forKey: .callData)
            replacementPattern = try container.decodeIfPresent(String.self, forKey: .replacementPattern)
            staticTarget = try container.decodeIfPresent(String.self, forKey: .staticTarget)
            staticExtradata = try container.decodeIfPresent(String.self, forKey: .staticExtradata)
            paymentToken = try container.decodeIfPresent(String.self, forKey: .paymentToken)
            basePrice = try container.decodeIfPresent(String.self, forKey: .basePrice)
            extra = try container.decodeIfPresent(String.self, forKey: .extra)
            quantity = try container.decodeIfPresent(String.self, forKey: .quantity)
            salt = try container.decodeIfPresent(String.self, forKey: .salt)
            v = try container.decodeIfPresent(Int.self, forKey: .v)
            r = try container.decodeIfPresent(String.self, forKey: .r)
            s = try container.decodeIfPresent(String.self, forKey: .s)
            approvedOnChain = try container.decodeIfPresent(Bool.self, forKey: .approvedOnChain)
            cancelled = try container.decodeIfPresent(Bool.self, forKey: .cancelled)
            finalized = try container.decodeIfPresent(Bool.self, forKey: .finalized)
            markedInvalid = try container.decodeIfPresent(Bool.self, forKey: .markedInvalid)
            prefixedHash = try container.decodeIfPresent(String.self, forKey: .prefixedHash)
            paymentTokenContract = try container.decodeIfPresent(OSAsset.OSPaymentToken.self, forKey: .paymentTokenContract)
        }
    }
}

// MARK: - OSUser

extension OSAsset.OSAccount {
    
    struct OSUser: Codable {
        public var username: String?
        
        private enum CodingKeys: String, CodingKey {
            case username = "username"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            username = try container.decodeIfPresent(String.self, forKey: .username)
        }
    }
}

// MARK: - OpenSea API Response

struct OSAssetResponse: Codable {
    public var assets: [OSAsset]?
    public var success: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case assets = "assets"
        case success = "success"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        assets = try container.decodeIfPresent([OSAsset].self, forKey: .assets)
        success = try container.decodeIfPresent(Bool.self, forKey: .success)
    }
}

struct OSAssetCollectionResponse: Codable {
    public var collection: OSAsset.OSAssetCollection?
    
    private enum CodingKeys: String, CodingKey {
        case collection = "collection"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collection = try container.decodeIfPresent(OSAsset.OSAssetCollection.self, forKey: .collection)
    }
}

// MARK: - Helpers

extension OSAsset: Identifiable {
    var id: String { tokenId }
}

extension OSAsset.OSAssetCollection: Identifiable {
    var id: String { name }
}
