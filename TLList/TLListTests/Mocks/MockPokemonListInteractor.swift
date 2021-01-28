//
//  MockPokemonListInteractor.swift
//  TLListTests
//
//  Created by npiparav on 26/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import Foundation
@testable import TLList

class MockPokemonListInteractor:  PokemonListInputInteractorProtocol {
    var pokeManhandler: PokemonHandlerProtocol?
    
    var isgetPokemonDescriptionsGetCalled = false

    weak var presenter: PokemonListOutputInteractorProtocol?
    

    func getpokemonDescriptions(pokemonName: String) {
        isgetPokemonDescriptionsGetCalled = true
        presenter?.pokemonDescriptionsListDidFetch(pokemonName: "pikachu", PokemonDescriptionList: test_flavouredTexts)
    }
    
    
}
