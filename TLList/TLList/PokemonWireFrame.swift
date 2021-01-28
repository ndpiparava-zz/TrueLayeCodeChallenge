//
//  PokemonWireFrame.swift
//  TrueLayerApp
//
//  Created by npiparav on 25/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class PokemonListWireFrame: PokemonListWireFrameProtocol {

    //Create Pokemon module and setup all wireframe and references
    static func createPokemonListModule(PokemonListRef: PokemonListViewProtocol) {
        let presenter: PokemonListPresenterProtocol & PokemonListOutputInteractorProtocol = PokemonListPresenter()
        let pokemonListView = PokemonListRef as! PokemonListView
        pokemonListView.presenter = presenter
        pokemonListView.presenter?.wireframe = PokemonListWireFrame()
        pokemonListView.presenter?.view = PokemonListRef
        pokemonListView.presenter?.interactor = PokemonListInteractor()
        pokemonListView.presenter?.pokemonCoredataHandler = CoreDataStack.shared.pokemonCoreDataHandler
        pokemonListView.presenter?.interactor?.presenter = presenter
        pokemonListView.presenter?.interactor?.pokeManhandler = PokemonWebServiceHandler()
        pokemonListView.presenter?.interactor?.pokeManhandler?.pokeManWebService = PokemonWebService()
    }
    
    
}
