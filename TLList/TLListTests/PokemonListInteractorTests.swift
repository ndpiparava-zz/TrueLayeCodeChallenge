//
//  PokemonListInteractorTests.swift
//  TLListTests
//
//  Created by npiparav on 26/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import XCTest
@testable import TLList

class PokemonListInteractorTests: XCTestCase {
    
    var sut : PokemonListInteractor!
    var mockListView : MockPokemonListView!
    var pokeManhandler : MockPokemonHandler!
    var mockPresenter : (PokemonListPresenterProtocol & PokemonListOutputInteractorProtocol)?

    override func setUpWithError() throws {
        //mockListView = MockPokemonListView()
       // MockPokemonWireFrame.createPokemonListModule(PokemonListRef: mockListView)
        
        
        sut = PokemonListInteractor()
        
        sut.pokeManhandler = MockPokemonHandler()
        //let presenter: PokemonListPresenterProtocol & PokemonListOutputInteractorProtocol = PokemonListPresenter()
        mockPresenter = MockPokemonListPresenter()
         sut.presenter = mockPresenter
        mockPresenter?.interactor = sut
       
        sut.getpokemonDescriptions(pokemonName: "")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        mockPresenter = nil
        pokeManhandler = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInteractorShouldUpdatePresenteronceDataLoaded_ShouldReturnTrue() {
        
        sut.getpokemonDescriptions(pokemonName: "")
        self.wait {}
        XCTAssertEqual((sut.presenter as! MockPokemonListPresenter).didFetchFinish, true)
        
    }

}

extension PokemonListInteractorTests {
    func wait(interval: TimeInterval = 3 , completion: @escaping (() -> Void)) {
        let exp = expectation(description: "")
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            completion()
            exp.fulfill()
        }
        waitForExpectations(timeout: interval + 0.1) // add 0.1 for sure asyn after called
    }
}

