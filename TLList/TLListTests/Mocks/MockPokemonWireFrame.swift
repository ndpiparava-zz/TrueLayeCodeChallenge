//
//  MockPokemonWireFrame.swift
//  TLListTests
//
//  Created by npiparav on 26/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import Foundation
@testable import TLList

class MockPokemonWireFrame: PokemonListWireFrameProtocol {
   
    static func createPokemonListModule(PokemonListRef: PokemonListViewProtocol) {
        
        let presenter: PokemonListPresenterProtocol & PokemonListOutputInteractorProtocol = MockPokemonListPresenter()
        let pokemonListView = PokemonListRef as! PokemonListView
        
        pokemonListView.presenter = presenter
        pokemonListView.presenter?.wireframe = MockPokemonWireFrame()
        pokemonListView.presenter?.view = pokemonListView
        pokemonListView.presenter?.interactor = MockPokemonListInteractor()
        pokemonListView.presenter?.pokemonCoredataHandler = CoreDataStack.shared.pokemonCoreDataHandler
        pokemonListView.presenter?.interactor?.presenter = presenter
        pokemonListView.presenter?.interactor?.pokeManhandler = MockPokemonHandler()
        pokemonListView.presenter?.interactor?.pokeManhandler?.pokeManWebService = MockPokemonWebService()
    }
    
    
}
