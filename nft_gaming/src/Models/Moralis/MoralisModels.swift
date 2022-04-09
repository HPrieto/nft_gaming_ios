//
//  Models.swift
//  nft_gaming
//
//  Created by Heriberto Prieto on 4/2/22.
//

import Foundation

struct MoralisAPIResponse<T: Codable>: Codable {
    var total: Int
    var page: Int
    var pageSize: Int
    var cursor: String
    var result: T
    
    private enum CodingKeys: String, CodingKey {
        case total = "total"
        case page = "page"
        case pageSize = "page_size"
        case cursor = "cursor"
        case result = "result"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.total = try container.decode(Int.self, forKey: .total)
        self.page = try container.decode(Int.self, forKey: .page)
        self.pageSize = try container.decode(Int.self, forKey: .pageSize)
        self.cursor = try container.decode(String.self, forKey: .cursor)
        self.result = try container.decode(T.self, forKey: .result)
    }
}

struct MoralisNFT: Codable {
    var tokenAddress: String
    var tokenId: String
    var blockNumberMinted: String
    var ownerOf: String
    var blockNumber: String
    var amount: String
    var contractType: String
    var name: String
    var symbol: String
    var tokenUri: String
    var metadata: Metadata
    var syncedAt: Date
    var isValid: Int
    var syncing: Int
    var frozen: Int
    
    private enum CodingKeys: String, CodingKey {
        case tokenAddress = "token_address"
        case tokenId = "token_id"
        case blockNumberMinted = "block_number_minted"
        case ownerOf = "owner_of"
        case blockNumber = "block_number"
        case amount = "amount"
        case contractType = "contract_type"
        case name = "name"
        case symbol = "symbol"
        case tokenUri = "token_uri"
        case metadata = "metadata"
        case syncedAt = "synced_at"
        case isValid = "is_valid"
        case syncing = "syncing"
        case frozen = "frozen"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        self.tokenAddress = try container.decode(String.self, forKey: .tokenAddress)
        self.tokenId = try container.decode(String.self, forKey: .tokenId)
        self.blockNumberMinted = try container.decode(String.self, forKey: .blockNumberMinted)
        self.ownerOf = try container.decode(String.self, forKey: .ownerOf)
        self.blockNumber = try container.decode(String.self, forKey: .blockNumber)
        self.amount = try container.decode(String.self, forKey: .amount)
        self.contractType = try container.decode(String.self, forKey: .contractType)
        self.name = try container.decode(String.self, forKey: .name)
        self.symbol = try container.decode(String.self, forKey: .symbol)
        self.tokenUri = try container.decode(String.self, forKey: .tokenUri)
//        if let metadataJson = try container.decode(String.self, forKey: .metadata).data(using: .utf8) {
//           let metadatat = try? JSONDecoder().decode(Metadata.self, from: metadataJson)
//            print(String(data: metadataJson, encoding: .utf8))
//        }
        //self.metadata = Metadata(name: "", description: "", image: "", properties: "", externalUrl: "")
        self.metadata = try container.decode(Metadata.self, forKey: .metadata)
        let dateStr: String = try container.decode(String.self, forKey: .syncedAt)
        if let syncedAt = dateFormatter.date(from: dateStr) {
            self.syncedAt = syncedAt
        } else {
            self.syncedAt = Date()
        }
        self.isValid = try container.decode(Int.self, forKey: .isValid)
        self.syncing = try container.decode(Int.self, forKey: .syncing)
        self.frozen = try container.decode(Int.self, forKey: .frozen)
    }
    
    init(tokenAddress: String,
         tokenId: String,
         blockNumberMinted: String,
         ownerOf: String,
         blockNumber: String,
         amount: String,
         contractType: String,
         name: String,
         symbol: String,
         tokenUri: String,
         metadata: Metadata,
         syncedAt: Date,
         isValid: Int = 1,
         syncing: Int = 2,
         frozen: Int = 0
    ) {
        self.tokenAddress = tokenAddress
        self.tokenId = tokenId
        self.blockNumberMinted = blockNumberMinted
        self.ownerOf = ownerOf
        self.blockNumber = blockNumber
        self.amount = amount
        self.contractType = contractType
        self.name = name
        self.symbol = symbol
        self.tokenUri = tokenUri
        self.metadata = metadata
        self.syncedAt = syncedAt
        self.isValid = isValid
        self.syncing = syncing
        self.frozen = frozen
    }
}

extension MoralisNFT {
    struct Metadata: Codable {
        var name: String
        var description: String
        var image: String
        var properties: [[String: String]]
        var externalUrl: String
        
        enum CodingKeys: String, CodingKey {
            case name = "name"
            case description = "description"
            case image = "image"
            case properties = "properties"
            case externalUrl = "external_url"
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decode(String.self, forKey: .name)
            description = try container.decode(String.self, forKey: .description)
            image = try container.decode(String.self, forKey: .image)
            properties = try container.decode([[String: String]].self, forKey: .properties)
            externalUrl = try container.decode(String.self, forKey: .externalUrl)
        }
        
        init(name: String,
             description: String,
             image: String,
             properties: [[String: String]],
             externalUrl: String
        ) {
            self.name = name
            self.description = description
            self.image = image
            self.properties = properties
            self.externalUrl = externalUrl
        }
    }
}

struct MoralisTransfer: Codable {
    var blockNumber: String
    var blockTimestamp: Date
    var blockHash: String
    var transactionHash: String
    var transactionIndex: Int32
    var logIndex: Int32
    var value: String
    var contractType: String
    var transactionType: String
    var tokenAddress: String
    var tokenId: String
    var fromAddress: String
    var toAddress: String
    var amount: String
    var verified: Int32
    var `operator`: String?
    
    private enum CodingKeys: String, CodingKey {
        case blockNumber = "block_number"
        case blockTimestamp = "block_timestamp"
        case blockHash = "block_hash"
        case transactionHash = "transaction_hash"
        case transactionIndex = "transaction_index"
        case logIndex = "log_index"
        case value = "value"
        case contractType = "contract_type"
        case transactionType = "transaction_type"
        case tokenAddress = "token_address"
        case tokenId = "token_id"
        case fromAddress = "from_address"
        case toAddress = "to_address"
        case amount = "amount"
        case verified = "verified"
        case `operator` = "operator"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        self.blockNumber = try container.decode(String.self, forKey: .blockNumber)
        let blockTimestampStr = try container.decode(String.self, forKey: .blockTimestamp)
        if let blockTimestamp = dateFormatter.date(from: blockTimestampStr) {
            self.blockTimestamp = blockTimestamp
        } else {
            self.blockTimestamp = Date()
        }
        self.blockHash = try container.decode(String.self, forKey: .blockHash)
        self.transactionHash = try container.decode(String.self, forKey: .transactionHash)
        self.transactionIndex = try container.decode(Int32.self, forKey: .transactionIndex)
        self.logIndex = try container.decode(Int32.self, forKey: .logIndex)
        self.value = try container.decode(String.self, forKey: .value)
        self.contractType = try container.decode(String.self, forKey: .contractType)
        self.transactionType = try container.decode(String.self, forKey: .transactionType)
        self.tokenAddress = try container.decode(String.self, forKey: .tokenAddress)
        self.tokenId = try container.decode(String.self, forKey: .tokenId)
        self.fromAddress = try container.decode(String.self, forKey: .fromAddress)
        self.toAddress = try container.decode(String.self, forKey: .toAddress)
        self.amount = try container.decode(String.self, forKey: .amount)
        self.verified = try container.decode(Int32.self, forKey: .verified)
        self.operator = try container.decodeIfPresent(String.self, forKey: .operator)
    }
}
