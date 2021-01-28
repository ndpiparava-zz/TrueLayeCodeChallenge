//
//  MockPokemonHandler.swift
//  TLListTests
//
//  Created by npiparav on 26/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import Foundation
@testable import TLList
class MockPokemonHandler: PokemonHandlerProtocol {
    var pokeManWebService: PokemonWebServiceProtocol?
    
    func getShakespeareanDescription(_ pokeMonName: String, completionHandler: @escaping (Result<[FlavorTextEntries]?, PokemonDataResponseError>) -> Void) {
        
        completionHandler(.success(test_flavouredTexts))
    }
    
    func getPokemonSprite(_ pokeMonName: String, completionHandler: @escaping (Result<PokemonSprite?, PokemonDataResponseError>) -> Void) {
        
        completionHandler(.success(test_pokemonSprite))
    }

}
