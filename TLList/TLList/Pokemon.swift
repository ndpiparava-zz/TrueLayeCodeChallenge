//
//  File.swift
//  TrueLayerApp
//
//  Created by npiparav on 24/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import Foundation

struct Pokemon : Codable {
    
    let sprites: PokemonSprite
}

struct PokemonSprite: Codable {
    
    let back_default: String?
    let back_female: String?
    let back_shiny: String?
    let back_shiny_female: String?
    let front_default: String?
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
}


