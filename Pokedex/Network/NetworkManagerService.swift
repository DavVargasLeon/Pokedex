//
//  NetworkManagerService.swift
//  Pokedex
//
//  Created by David Vargas on 26/01/24.
//

import Foundation
import Moya

final class NetworkManagerService {
    
    static let shared = NetworkManagerService()
    let provider: MoyaProvider<NetworkRouter>
    
    public init() {
        provider = .init()
    }
}
