//
//  MockPokemonWebService.swift
//  TLListTests
//
//  Created by npiparav on 26/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import Foundation
@testable import TLList

class MockPokemonWebService: PokemonWebServiceProtocol {
    
    func getData<T>(fromUrl: String, responseModelType: T.Type, completionHandler: @escaping (Result<T?, PokemonDataResponseError>) -> Void) where T : Decodable {
        
        completionHandler(.success(nil))
    }
    
    func getPokemonSprites(pokeMonName: String, completionHandler: @escaping (Result<Pokemon?, PokemonDataResponseError>) -> Void) {
        
        completionHandler(.success(Pokemon(sprites: test_pokemonSprite)))
        
    }
    
    func getPokemonSpecies(pokeMonName: String, completionHandler: @escaping (Result<PokemonSpecies?, PokemonDataResponseError>) -> Void) {
        
        completionHandler(.success(PokemonSpecies(flavor_text_entries: test_flavouredTexts)))
        
    }
    
    func getImageData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        
    }
    
    func getSpriteThumbNailImage(from urlString: String, completionHandler: @escaping (Result<Data, PokemonDataResponseError>) -> Void) {
        
    }
}
