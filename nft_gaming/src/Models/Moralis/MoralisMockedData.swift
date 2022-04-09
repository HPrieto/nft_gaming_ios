//
//  MockedData.swift
//  nft_gaming
//
//  Created by Heriberto Prieto on 4/3/22.
//

import Foundation

#if DEBUG

extension MoralisAPIResponse where T == [MoralisTransfer] {
    static var mockedData: MoralisAPIResponse<[MoralisTransfer]> {
        let jsonData = Data.data(fromJsonFileNamed: "Moralis+GetContractNFTTransfers")!
        return try! JSONDecoder().decode(MoralisAPIResponse<[MoralisTransfer]>.self, from: jsonData)
    }
}

extension MoralisAPIResponse where T == [MoralisNFT] {
    static var mockedData: MoralisAPIResponse {
        let jsonData = Data.data(fromJsonFileNamed: "MoralisAPIResponse")!
        return try! JSONDecoder().decode(MoralisAPIResponse.self, from: jsonData)
    }
}

extension MoralisNFT {
    
    static var mockedData: [MoralisNFT] {
        MoralisAPIResponse<[MoralisNFT]>.mockedData.result
    }
}

#endif

extension Data {
    
    static func data(fromJsonFileNamed fileName: String) -> Data? {
        
        guard let jsonFile = Bundle.main.path(forResource: fileName, ofType: "json") else {
            return nil
        }
        
        do {
            guard let jsonData: Data = try String(contentsOfFile: jsonFile).data(using: .utf8) else {
                return nil
            }
            
            return jsonData
        } catch {
            return nil
        }
    }
}
