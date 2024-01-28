//
//  NetworkRouter.swift
//  Pokedex
//
//  Created by David Vargas on 26/01/24.
//

import Foundation
import Moya

enum NetworkRouter {
    case detailPokemon(name: Int)
}

extension NetworkRouter: TargetType {
    var baseURL: URL {
        URL(string: "https://pokeapi.co/api/v2/pokemon")!
    }
    
    var path: String {
        switch self {
        case .detailPokemon(let pokemonName):
            return "/\(pokemonName)"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        switch self {
        case .detailPokemon:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
}
