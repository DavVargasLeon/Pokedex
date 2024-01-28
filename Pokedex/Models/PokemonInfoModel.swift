//
//  PokemonInfoModel.swift
//  Pokedex
//
//  Created by David Vargas on 26/01/24.
//

import Foundation

struct PokemonInfoModel: Decodable {
    let abilities: [AbilitiesPokemon]
    let id: Int
    let name: String
    let sprites: PokeImageModel
    let stats: [StatsPokemon]
    let types: [TypeOfPokemons]
}

struct AbilitiesPokemon: Decodable {
    let ability: NameAbility
}

struct NameAbility: Decodable {
    let name: String
}

struct PokeImageModel: Decodable {
    let other: PokemonOficial
}

struct PokemonOficial: Decodable {
    let officialArtwork: FrontPokemonImage
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}
struct FrontPokemonImage: Codable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct StatsPokemon: Decodable {
    let baseStat: Int
    let stat: NameStat
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }
}

struct NameStat: Decodable {
    let name: String
}

struct TypeOfPokemons: Decodable {
    let type: NameType
}

struct NameType: Decodable {
    let name: String
}
