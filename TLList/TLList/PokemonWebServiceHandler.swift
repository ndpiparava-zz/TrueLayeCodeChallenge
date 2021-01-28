//
//  PokemonWebService.swift
//  TrueLayerApp
//
//  Created by npiparav on 23/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import Foundation

//https://pokeapi.co/api/v2/pokemon-species/wormadam
//https://pokeapi.co/api/v2/pokemon/butterfree

fileprivate struct UrlMaker {
    
   fileprivate func getFullUrl(endPoints: String?, params:String?) -> Result<String, PokemonDataResponseError> {
        
        guard let endPoints = endPoints  else {
            return .failure(PokemonDataResponseError.invalidRequestURLString)
        }
        
        guard let params = params else {
            return .failure(PokemonDataResponseError.invalidRequestURLString)
        }
        
        let finalUrl = WebServiceConstants.pokeMonBaseUrl.appending(endPoints).appending(params)
        return .success(finalUrl)
        
    }
}

final class PokemonWebService: PokemonWebServiceProtocol {
  
    private var urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func getData <T: Decodable>(fromUrl: String, responseModelType : T.Type, completionHandler: @escaping (Result<T?, PokemonDataResponseError>) -> Void) {
        
        guard let url = URL(string: fromUrl) else {
            completionHandler(.failure(PokemonDataResponseError.invalidRequestURLString))
            return
        }
        
        let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completionHandler(.failure(PokemonDataResponseError.invalidResponse))
                return
            }
        
            if let data = data {
                
                //let jsonDataString = String(decoding: data, as: UTF8.self)
                //print("jsonDataString = \(jsonDataString)")
                
                let pokeMonDataModel = Bundle.main.decodable(T.self, from: data)
                       //print("pokemonResponseModel : \(String(describing: pokeMonDataModel))")
                       completionHandler(.success(pokeMonDataModel))
            }
            else{
                completionHandler(.failure(PokemonDataResponseError.invalidResponse))
            }
         }
        urlSession.resume()
    }
    
    func getPokemonSprites(pokeMonName: String, completionHandler: @escaping (Result<Pokemon?, PokemonDataResponseError>) -> Void) {
        
        let urlResult = UrlMaker().getFullUrl(endPoints: WebServiceConstants.pokemon_Url, params: pokeMonName)
        switch urlResult {
        case .success(let urlString): do {
            self.getData(fromUrl: urlString, responseModelType: Pokemon.self) { result in
                
                switch result {
                case .success(let pokemon):
                    completionHandler (.success(pokemon))
                
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
        }
            
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    func getPokemonSpecies(pokeMonName: String, completionHandler: @escaping (Result<PokemonSpecies?, PokemonDataResponseError>) -> Void) {
        
        let urlResult = UrlMaker().getFullUrl(endPoints: WebServiceConstants.pokemonSpecie_Url, params: pokeMonName)
        switch urlResult {
        case .success(let urlString): do {
            self.getData(fromUrl: urlString, responseModelType: PokemonSpecies.self) { result in
                
                switch result {
                case .success(let pokemonSpecies):
                    completionHandler (.success(pokemonSpecies))
                
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
        }
            
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    func getImageData(from url: URL, completion:  @escaping (Data?, URLResponse?, Error?)-> ()) {
           URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
       
       //fetch image data from url
    func getSpriteThumbNailImage(from urlString: String, completionHandler: @escaping (Result<Data, PokemonDataResponseError>) -> Void) {
        guard let url = URL(string: urlString) else {
            
            completionHandler(.failure(PokemonDataResponseError.invalidRequestURLString))
            return
        }
        
        getImageData(from: url) { data, response, error in
            print(response?.suggestedFilename ?? url.lastPathComponent)
            if let data = data {
                completionHandler(.success(data))
            }
            else{
                completionHandler(.failure(PokemonDataResponseError.invalidResponse))
            }
        }
    }
       
}
