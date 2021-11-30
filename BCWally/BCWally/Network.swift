//
//  Network.swift
//  BCWally
//
//  Created by Wolf McNally on 11/29/21.
//

import Foundation

public enum Network: UInt32, CaseIterable, Equatable {
    case mainnet = 0
    case testnet = 1
}

extension Network {
    public var wifPrefix: UInt32 {
        switch self {
        case .mainnet:
            return UInt32(WALLY_ADDRESS_VERSION_WIF_MAINNET)
        case .testnet:
            return UInt32(WALLY_ADDRESS_VERSION_WIF_TESTNET)
        }
    }
    
    public static func network(forWIFPrefix prefix: UInt8) -> Network? {
        switch prefix {
        case UInt8(WALLY_ADDRESS_VERSION_WIF_MAINNET):
            return .mainnet
        case UInt8(WALLY_ADDRESS_VERSION_WIF_TESTNET):
            return .testnet
        default:
            return nil
        }
    }
}

extension Network {
    public var wallyNetwork: UInt32 {
        switch self {
        case .mainnet:
            return UInt32(WALLY_NETWORK_BITCOIN_MAINNET)
        case .testnet:
            return UInt32(WALLY_NETWORK_BITCOIN_TESTNET)
        }
    }
}

extension Network {
    public func wallyBIP32Version(isPrivate: Bool) -> UInt32 {
        switch self {
        case .mainnet:
            return UInt32(isPrivate ? BIP32_VER_MAIN_PRIVATE : BIP32_VER_MAIN_PUBLIC)
        case .testnet:
            return UInt32(isPrivate ? BIP32_VER_TEST_PRIVATE : BIP32_VER_TEST_PUBLIC)
        }
    }
}
