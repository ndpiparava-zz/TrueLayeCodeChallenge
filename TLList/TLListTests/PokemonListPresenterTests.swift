//
//  PokemonListPresenterTests.swift
//  TLListTests
//
//  Created by npiparav on 26/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import XCTest
@testable import TLList

class PokemonListPresenterTests: XCTestCase {

    var sut : PokemonListPresenter!
    var interactor : MockPokemonListInteractor!
    var view : MockPokemonListView!
    var pokemonCoredataHandler : MockPokemonCoreDataHandler!
    
    override func setUpWithError() throws {
        view  = MockPokemonListView()
        pokemonCoredataHandler = MockPokemonCoreDataHandler()
        
        sut = PokemonListPresenter()
        interactor = MockPokemonListInteractor()
        
        sut.interactor = interactor
        interactor.presenter = sut
        sut.view = view
        
        view.presenter = sut
        
        sut.pokemonCoredataHandler = pokemonCoredataHandler
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        interactor = nil
        view = nil
        pokemonCoredataHandler = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPresenterShouldFetchDescriptionsAndPassItToView_ShouldReturnOne() {
        
        sut.loadPokemonDescriptions(pokemonName: "pikachu")
        self.wait {}
        XCTAssertEqual(view.pokemoDescriptionsList.count,1)
    }
    
    func  testPresenterShouldFetchFavouriteDescriptionsAndPassItToView_ShouldReturnOne() {
        sut.pokemonCoredataHandler?.addDescriptionToFavourite(description: "I am pikachu")
        sut.getFavoriteDescriptions()
        self.wait {}
        print(view.favouritesDescriptions)
        XCTAssertEqual(view.favouritesDescriptions.count,1)
    }
   

}

extension PokemonListPresenterTests {
    
    func wait(interval: TimeInterval = 1 , completion: @escaping (() -> Void)) {
        let exp = expectation(description: "")
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            completion()
            exp.fulfill()
        }
        waitForExpectations(timeout: interval + 0.1) // add 0.1 for sure asyn after called
    }
}
