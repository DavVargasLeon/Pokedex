//
//  Network+RequesExtension.swift
//  Pokedex
//
//  Created by David Vargas on 26/01/24.
//

import Foundation
import Moya
import Alamofire

extension NetworkManagerService {
    
    func getDetailPokemon(with name: Int, completion: @escaping (Result<PokemonInfoModel, Error>) -> Void) {
        self.provider.request(.detailPokemon(name: name)) { result in
            switch result {
            case .success(let response):
                guard let model: PokemonInfoModel = try? JSONDecoder().decode(PokemonInfoModel.self, from: response.data) else { return }
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
