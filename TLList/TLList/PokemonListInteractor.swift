//
//  PokemonListInteractor.swift
//  TrueLayerApp
//
//  Created by npiparav on 25/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import Foundation

class PokemonListInteractor: PokemonListInputInteractorProtocol {
    
    var pokeManhandler: PokemonHandlerProtocol?
    weak var presenter: PokemonListOutputInteractorProtocol?
    
    func getpokemonDescriptions(pokemonName: String) {
        pokeManhandler?.getShakespeareanDescription(pokemonName) { Result in
        switch Result {
            case .success(let pokemanDescriptions):
                self.presenter?.pokemonDescriptionsListDidFetch(pokemonName:pokemonName, PokemonDescriptionList: pokemanDescriptions ?? [])
            case .failure(let error):
                self.presenter?.pokemonDescriptionListFetchError(pokemonName:pokemonName, PokemonDescriptionFetchError: error)
        }
    }
  }
}
