//
//  MockPokemonListView.swift
//  TLListTests
//
//  Created by npiparav on 26/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import Foundation
import UIKit
@testable import TLList

class MockPokemonListView:UIViewController, PokemonListViewProtocol {
    
    var presenter :PokemonListPresenterProtocol?
    var pokemoDescriptionsList = [FlavorTextEntries]()
    var pokeMonName: String?
    var favouritesDescriptions = [String]()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Available Descriptions"
        MockPokemonWireFrame.createPokemonListModule(PokemonListRef: self)
        presenter?.getFavoriteDescriptions()
        presenter?.viewDidLoad(with: pokeMonName ?? "pikachu")
    }
    
    public override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
    }
    
    
    func showDescriptions(with pokemonName: String, flavoredTexts: [FlavorTextEntries]) {
        
        self.pokemoDescriptionsList = flavoredTexts
        
    }
    
    func showDescriptionsLoadError(pokemonName: String, error: PokemonDataResponseError) {
        
    }
    
    func favouriteDescriptionsLoaded(descriptions: [String]) {
    
        self.favouritesDescriptions = descriptions
    }

}
