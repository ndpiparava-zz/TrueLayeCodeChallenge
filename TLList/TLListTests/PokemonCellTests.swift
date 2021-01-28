//
//  PokemonCellTests.swift
//  TLListTests
//
//  Created by npiparav on 27/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import XCTest

@testable import TLList
class PokemonCellTests: XCTestCase {
    
    var tableView : UITableView!
    var mockDataSource: MockCellDataSource!
    var pokemonListView: PokemonListView!
   

    override func setUpWithError() throws {
        
        pokemonListView  = PokemonListView()
        _ = pokemonListView?.view
        
        MockPokemonWireFrame.createPokemonListModule(PokemonListRef: pokemonListView!)
        
        //tableView = pokemonListView?.PokemonTableView
        tableView = pokemonListView?.pokemonTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
        
        let cell = UINib(nibName: "PokemonCell",
                                  bundle:Bundle(for: PokemonCell.self))
        pokemonListView.pokemonTableView.register(cell,
                                forCellReuseIdentifier: "PokemonCell")
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        tableView = nil
        mockDataSource = nil
        pokemonListView = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCell_Config_ShouldSetLablesToData() {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell") as! PokemonCell
        cell.configPokemonCell(pokemonDescription: "I am pikachu", pokeMonName: "pikachu", iszFavourite: true)
        
        XCTAssertEqual(cell.PokemonTitle.text, "pikachu")
        XCTAssertEqual(cell.pokemonDescription.text, "I am pikachu")
        
    }
    
    func testCell_shoudlSetThumbnail() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell") as! PokemonCell
        
        cell.setThumbnailImage(pokemonName: "pikachu")
        self.wait {
            
        }
        
        XCTAssertNotNil(cell.PokemonThumbnailImage?.image)
        
    }
}


extension PokemonCellTests {
    
    func wait(interval: TimeInterval = 3 , completion: @escaping (() -> Void)) {
        let exp = expectation(description: "")
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            completion()
            exp.fulfill()
        }
        waitForExpectations(timeout: interval + 0.1) // add 0.1 for sure asyn after called
    }
}
