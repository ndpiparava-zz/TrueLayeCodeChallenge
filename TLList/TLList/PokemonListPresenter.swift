//
//  PokemonList.swift
//  TrueLayerApp
//
//  Created by npiparav on 25/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import Foundation

class PokemonListPresenter : PokemonListPresenterProtocol {
    
    var pokemonCoredataHandler: PokemonCoredataHandlerProtocol?
    var interactor: PokemonListInputInteractorProtocol?
    weak var view: PokemonListViewProtocol?
    var wireframe: PokemonListWireFrameProtocol?

    
    func viewDidLoad(with pokeMonName: String) {
        self.getFavoriteDescriptions()
        self.loadPokemonDescriptions(pokemonName: pokeMonName)
    }
    
    func loadPokemonDescriptions(pokemonName:String) {
        interactor?.getpokemonDescriptions(pokemonName: pokemonName)
    }
    
    func getFavoriteDescriptions() {
        DispatchQueue.main.async { [weak self] in
            guard let favouritesDescriptions = self?.pokemonCoredataHandler?.getFavoriteDescriptions() else { return }
            self?.view?.favouriteDescriptionsLoaded(descriptions: favouritesDescriptions)
        }
       
    }
}

extension PokemonListPresenter : PokemonListOutputInteractorProtocol {
    func pokemonDescriptionsListDidFetch(pokemonName:String, PokemonDescriptionList: [FlavorTextEntries]) {
        view?.showDescriptions(with:pokemonName, flavoredTexts:PokemonDescriptionList)
    }
    
    func pokemonDescriptionListFetchError(pokemonName:String, PokemonDescriptionFetchError: PokemonDataResponseError) {
        view?.showDescriptionsLoadError(pokemonName: pokemonName, error: PokemonDescriptionFetchError)
    }

}
