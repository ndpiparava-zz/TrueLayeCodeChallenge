//
//  PokemonListViewTests.swift
//  TLListTests
//
//  Created by npiparav on 26/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import XCTest
@testable import TLList

class PokemonListViewTests: XCTestCase {
    
    var sut : PokemonListView!
    //var mocktableView : UITableView!

    override func setUpWithError() throws {
        sut  = PokemonListView()
         _ = sut.view
        
        MockPokemonWireFrame.createPokemonListModule(PokemonListRef: sut)
        
    }

    override func tearDownWithError() throws {
        sut = nil
        //mocktableView = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShouldloadFavouriteDescriptionOnViewDidLoad_shouldReturn1() {
        //sut.viewDidLoad()
        sut.presenter?.viewDidLoad(with: "pikachu")
        XCTAssertEqual(sut.favouritesDescriptions.count, 1)
    }
    
    func testShouldloadDescriptionsWebOnViewDidLoad_shouldReturn1() {
        //sut.viewDidLoad()
        
        sut.presenter?.viewDidLoad(with: "pikachu")
        self.wait {}
        XCTAssertEqual(sut.pokemoDescriptionsList.count, 1)
        XCTAssertEqual(sut.pokemonTableView.numberOfRows(inSection: 0), 1)
    }
    
    func testShouldShowDescription_ShouleReturOne() {
        sut.showDescriptions(with: "pikachu", flavoredTexts: test_flavouredTexts)
        self.wait {}
        XCTAssertEqual(sut.pokemonTableView.numberOfRows(inSection: 0), 1)
        
    }
    
    func testShouldshowAlertWhenErrorInLoadDescription_ShouldNotPresentAnyData() {
        sut.showDescriptionsLoadError(pokemonName: "pikachu", error: PokemonDataResponseError.invalidResponse)
        self.wait {}
        XCTAssertEqual(sut.pokemoDescriptionsList.count, 0)
        }

}

extension PokemonListViewTests {
    func wait(interval: TimeInterval = 0.5 , completion: @escaping (() -> Void)) {
        let exp = expectation(description: "")
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            completion()
            exp.fulfill()
        }
        waitForExpectations(timeout: interval + 0.1) // add 0.1 for sure asyn after called
    }
}
