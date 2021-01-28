//
//  PokemonDataResponseError.swift
//  TrueLayerApp
//
//  Created by npiparav on 24/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import Foundation

enum PokemonDataResponseError: LocalizedError, Equatable {
    
    case invalidResponse
    case invalidRequestURLString
    case failedRequest(description: String)
    
     var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponse, .invalidRequestURLString:
            return "InValid Response or String"
        }
    }
}
