//
//  PokemanProtocol.swift
//  TrueLayerApp
//
//  Created by npiparav on 24/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import Foundation
import UIKit
import CoreData

 protocol PokemonWebServiceProtocol {
    
    func getData <T: Decodable>(fromUrl: String, responseModelType : T.Type, completionHandler: @escaping (Result<T?, PokemonDataResponseError>) -> Void)
    func getPokemonSprites(pokeMonName: String, completionHandler: @escaping (Result<Pokemon?, PokemonDataResponseError>) -> Void)
    func getPokemonSpecies(pokeMonName: String, completionHandler: @escaping (Result<PokemonSpecies?, PokemonDataResponseError>) -> Void)
    func getImageData(from url: URL, completion:  @escaping (Data?, URLResponse?, Error?)-> ())
    func getSpriteThumbNailImage(from urlString: String, completionHandler: @escaping (Result<Data, PokemonDataResponseError>) -> Void)
}


 protocol PokemonListViewProtocol : class {
    
    func showDescriptions(with pokemonName:String, flavoredTexts:[FlavorTextEntries])
    func showDescriptionsLoadError(pokemonName:String, error: PokemonDataResponseError)
    func favouriteDescriptionsLoaded(descriptions:[String])
}

protocol PokemonListPresenterProtocol {
    var interactor: PokemonListInputInteractorProtocol? {get set}
    var view: PokemonListViewProtocol? {get set}
    var wireframe: PokemonListWireFrameProtocol?{get set}
    var pokemonCoredataHandler : PokemonCoredataHandlerProtocol?{get set}
    
    func viewDidLoad(with pokemonName:String)
    func getFavoriteDescriptions()
    func loadPokemonDescriptions(pokemonName:String) 
}

protocol PokemonListInputInteractorProtocol {
    var presenter: PokemonListOutputInteractorProtocol? {get set}
    var  pokeManhandler : PokemonHandlerProtocol? {get set}
    
    //Presenter-Interactor
    func getpokemonDescriptions(pokemonName: String)
}

protocol PokemonListOutputInteractorProtocol : class {
    func pokemonDescriptionsListDidFetch(pokemonName: String, PokemonDescriptionList: [FlavorTextEntries])
    func pokemonDescriptionListFetchError(pokemonName: String, PokemonDescriptionFetchError: PokemonDataResponseError)
}


protocol PokemonListWireFrameProtocol {
    static func createPokemonListModule(PokemonListRef: PokemonListViewProtocol)
}

protocol PokemonCoredataHandlerProtocol {
    func getFavoriteDescriptions()-> [String]?
    func addDescriptionToFavourite(description:String)
}

 protocol PokemonHandlerProtocol {
    var pokeManWebService : PokemonWebServiceProtocol?{get set}
    func getShakespeareanDescription(_ pokeMonName: String, completionHandler: @escaping (Result<[FlavorTextEntries]?,PokemonDataResponseError>) -> Void)
    func  getPokemonSprite(_ pokeMonName: String, completionHandler:@escaping (Result<PokemonSprite?,PokemonDataResponseError>)-> Void)
}
