//  web3swift
//
//  Created by Alex Vlasov.
//  Copyright © 2018 Alex Vlasov. All rights reserved.
//

import Foundation
import BigInt


extension web3.Eth {
    public func block(by number: UInt, fullTransactions: Bool = false) async throws -> Block {
        let blockNumber = BlockNumber.exact(number)
        return try await block(by: blockNumber, fullTransactions: fullTransactions)
    }

    public func block(by number: BlockNumber, fullTransactions: Bool = false) async throws -> Block {
        let requestCall: APIRequest = .getBlockByNumber(number, fullTransactions)
        let response: APIResponse<Block> = try await APIRequest.sendRequest(with: self.provider, for: requestCall)
        return response.result
    }
}
