//
//  PokeManHandler.swift
//  TrueLayerApp
//
//  Created by npiparav on 23/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import Foundation

final class PokemonWebServiceHandler : PokemonHandlerProtocol {
    
    var pokeManWebService: PokemonWebServiceProtocol?
     func  getPokemonSprite(_ pokeMonName: String, completionHandler:@escaping (Result<PokemonSprite?,PokemonDataResponseError>)-> Void) {
        
        pokeManWebService?.getPokemonSprites(pokeMonName: pokeMonName) {result in
            switch result {
            case .success(let pokemon):
                completionHandler(.success(pokemon?.sprites))
                
            case .failure(let error):
                completionHandler(.failure(error))
                
            }
        }
    }
    
     func getShakespeareanDescription(_ pokeMonName: String, completionHandler: @escaping (Result<[FlavorTextEntries]?,PokemonDataResponseError>) -> Void) {
        
        pokeManWebService?.getPokemonSpecies(pokeMonName: pokeMonName) {result in
            
                   switch result {
                   case .success(let pokemonSpecies):
                    completionHandler(.success(pokemonSpecies?.flavor_text_entries))
                       
                   case .failure(let error):
                       completionHandler(.failure(error))
                   }
            }
       }
}

