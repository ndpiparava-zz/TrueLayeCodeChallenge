//
//  MockPokemonCoreDataHandler.swift
//  TLListTests
//
//  Created by npiparav on 27/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//



@testable import TLList

class MockPokemonCoreDataHandler: PokemonCoredataHandlerProtocol {
    
    var favdescriptions = [String]()
    
    func getFavoriteDescriptions() -> [String]? {
        
        print(favdescriptions)
        return favdescriptions
    }
    
    func addDescriptionToFavourite(description: String) {
        self.favdescriptions.append(description)
    }
    
}
