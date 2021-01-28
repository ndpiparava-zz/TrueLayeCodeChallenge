//
//  MockPokemonListPresenter.swift
//  TLListTests
//
//  Created by npiparav on 26/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import Foundation
@testable import TLList

class MockPokemonListPresenter:PokemonListPresenterProtocol {
    
    var interactor: PokemonListInputInteractorProtocol?
    var view: PokemonListViewProtocol?
    var wireframe: PokemonListWireFrameProtocol?
    var pokemonCoredataHandler: PokemonCoredataHandlerProtocol?
    
    var didFetchFinish  = false
    
    func viewDidLoad(with pokemonName: String) {
        self.getFavoriteDescriptions()
        self.loadPokemonDescriptions(pokemonName: pokemonName)
    }
    
    func loadPokemonDescriptions(pokemonName:String) {
        interactor?.getpokemonDescriptions(pokemonName: pokemonName)
    }
    
    func getFavoriteDescriptions() {
        view?.favouriteDescriptionsLoaded(descriptions: ["Favourite Descriptions loaded"])
    }
}

extension MockPokemonListPresenter : PokemonListOutputInteractorProtocol {
    func pokemonDescriptionsListDidFetch(pokemonName:String, PokemonDescriptionList: [FlavorTextEntries]) {
        view?.showDescriptions(with:pokemonName, flavoredTexts:PokemonDescriptionList)
        self.didFetchFinish = true
    }
    
    func pokemonDescriptionListFetchError(pokemonName:String, PokemonDescriptionFetchError: PokemonDataResponseError) {
        view?.showDescriptionsLoadError(pokemonName: pokemonName, error: PokemonDescriptionFetchError)
        self.didFetchFinish = true
    }

}
