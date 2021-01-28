//
//  PokemanInformation.swift
//  TrueLayerApp
//
//  Created by npiparav on 24/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import Foundation

struct Language : Codable {
    let name: String
    let url: String
}

struct Version: Codable {
    let name: String
    let url : String
}

struct FlavorTextEntries: Codable {
    
    let flavor_text: String
    let language:Language
    let version: Version
    
}

struct  PokemonSpecies : Codable {
    
    public let flavor_text_entries: [FlavorTextEntries]
}
