//
//  PokemonListView.swift
//  TrueLayerApp
//
//  Created by npiparav on 25/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

/*
https://pokeapi.co/api/v2/pokemon-species/pikachu
https://pokeapi.co/api/v2/pokemon/pikachu
 
 https://pokeapi.co/api/v2/pokemon-species/arceus
 https://pokeapi.co/api/v2/pokemon/arceus
 
 */

import Foundation
import UIKit


public class PokemonListView: UIViewController, PokemonListViewProtocol {
    
    @IBOutlet weak var pokemonTableView: UITableView!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    var presenter :PokemonListPresenterProtocol?
    var pokemoDescriptionsList = [FlavorTextEntries]()
    var pokeMonName: String?
    var favouritesDescriptions = [String]()
    
    public init() {
        super.init(nibName: "PokemonListView", bundle:Bundle(for: PokemonListView.self) )
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func registerTableViewCells() {
        
        let cell = UINib(nibName: "PokemonCell",
                                  bundle:Bundle(for: PokemonCell.self))
        self.pokemonTableView.register(cell,
                            forCellReuseIdentifier: "PokemonCell")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Available Descriptions"
        
        PokemonListWireFrame.createPokemonListModule(PokemonListRef: self)
        loadingSpinner?.startAnimating()
        presenter?.getFavoriteDescriptions()
        presenter?.viewDidLoad(with: pokeMonName ?? "pikachu")
        self.registerTableViewCells()
    }
    
    public override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
    }
    
     func showDescriptions(with pokemonName:String, flavoredTexts: [FlavorTextEntries]) {
        DispatchQueue.main.async { [weak self] in
            self!.pokeMonName = pokemonName
            self!.pokemoDescriptionsList.removeAll()
            self!.pokemoDescriptionsList = flavoredTexts
            print(self!.pokemoDescriptionsList.count)
            self!.pokemonTableView.reloadData()
            self!.loadingSpinner.stopAnimating()
        }
    }
    
     func showDescriptionsLoadError(pokemonName:String, error: PokemonDataResponseError) {
       
        DispatchQueue.main.async {[weak self] in
            self?.pokeMonName = pokemonName
            self?.loadingSpinner.stopAnimating()
            let alert = UIAlertController(title: "Loading Error", message: "Something went wrong,could not load Pokemons.Please try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
     func favouriteDescriptionsLoaded(descriptions:[String]) {
        self.favouritesDescriptions = descriptions
    }
    
}


extension PokemonListView :UITableViewDataSource ,UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemoDescriptionsList.count
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell") as! PokemonCell
        let pokemonDescription = pokemoDescriptionsList[indexPath.row]
        let isItFavourite = self.favouritesDescriptions.contains(pokemonDescription.flavor_text)
        cell.configPokemonCell(pokemonDescription: pokemonDescription.flavor_text, pokeMonName: self.pokeMonName!,iszFavourite: isItFavourite)
        cell.setThumbnailImage(pokemonName: self.pokeMonName!)
        return cell
    }
}

extension PokemonListView : UISearchBarDelegate {
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.presenter?.interactor?.getpokemonDescriptions(pokemonName: searchBar.text!.lowercased())
    }
}

