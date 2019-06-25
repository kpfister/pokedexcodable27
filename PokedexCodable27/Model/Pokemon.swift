//
//  Pokemon.swift
//  PokedexCodable27
//
//  Created by Karl Pfister on 6/25/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import Foundation

struct TopLevelDictionary: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case id
        case abilities
        case spritesDictionary = "sprites"
    }
    
    let name: String
    let id: Int
    let abilities: [AbilityDictionary]
    let spritesDictionary: SpritesDictionary
}

struct AbilityDictionary: Decodable {
    let ability: Ability
    
    struct Ability: Decodable {
        let name: String
    }
}

struct SpritesDictionary: Decodable {
    let image: URL
    
    private enum CodingKeys: String, CodingKey {
        case image = "front_shiny"
    }
}
