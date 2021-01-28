//
//  CoreDataStackTests.swift
//  TLListTests
//
//  Created by npiparav on 27/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import XCTest
import  CoreData
@testable import TLList

class CoreDataStackTests: XCTestCase {
    
    var sut : CoreDataStack!
    var coredataHandler : PokemonCoreDataHandler!

    override func setUpWithError() throws {
        sut = CoreDataStack.shared
        coredataHandler = PokemonCoreDataHandler()
        sut.pokemonCoreDataHandler = coredataHandler
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        coredataHandler = nil
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadPersistanceStore_ShouldNotreturnNil() {
        
        XCTAssertNotNil(sut.persistentContainer)
    }
    
//    func testShouldChangeContext_ShouldSaveData() {
//        
//         let count = sut.pokemonCoreDataHandler.getFavoriteDescriptions()?.count  ?? 0
//        coredataHandler.addDescriptionToFavourite(description: " i am the pikachu")
//        self.wait {}
//        XCTAssertEqual(sut.pokemonCoreDataHandler.getFavoriteDescriptions()?.count, count+1)
//    }
   

}

extension CoreDataStackTests {
    
    func wait(interval: TimeInterval = 1 , completion: @escaping (() -> Void)) {
        let exp = expectation(description: "")
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            completion()
            exp.fulfill()
        }
        waitForExpectations(timeout: interval + 0.1) // add 0.1 for sure asyn after called
    }
}
