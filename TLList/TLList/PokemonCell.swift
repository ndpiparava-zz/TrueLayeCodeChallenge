//
//  PokemonCell.swift
//  TLList
//
//  Created by npiparav on 27/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import UIKit

class PokemonCell: UITableViewCell {

      @IBOutlet weak var PokemonThumbnailImage: UIImageView!
      @IBOutlet weak var PokemonTitle: UILabel!
      @IBOutlet weak var pokemonDescription: UILabel!
      @IBOutlet weak var favButton: UIButton!
      
      private var spritescollection : PokemonSprite?
      private var pokemonImage : UIImage?
      private var isFavourite: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func markASFavourite(_ sender: Any) {
        
        let coredataHandler = CoreDataStack.shared.pokemonCoreDataHandler
        coredataHandler.addDescriptionToFavourite(description: pokemonDescription.text!)
         let button = sender as! UIButton
        
        if(self.isFavourite) {
            button.setImage(UIImage(systemName: "star"), for: .normal)
        }
        else {
            button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
        
        self.isFavourite = !self.isFavourite
        
    }
    
    func configPokemonCell(pokemonDescription: String, pokeMonName:String, iszFavourite: Bool)
    {
        self.pokemonDescription.text = pokemonDescription
        self.PokemonTitle.text = pokeMonName
        
        self.isFavourite = iszFavourite
        if(iszFavourite) {
            self.favButton.imageView?.image = UIImage(systemName: "star.fill")
        }
        else {
            self.favButton.imageView?.image = UIImage(systemName: "star")
        }
    }
    
    func downLoadAndSetImage( sprites : PokemonSprite) {
        let webservice = PokemonWebService()
        webservice.getSpriteThumbNailImage(from: sprites.back_default ?? sprites.back_female ?? sprites.back_shiny_female ?? "") { result in
            switch result {
                case .success(let imageData):
                    DispatchQueue.main.async {[weak self]  in
                        self?.pokemonImage = UIImage(data: imageData)
                        self?.PokemonThumbnailImage?.image = self?.pokemonImage
                    }
                case .failure(let error):
                    print(error.errorDescription ?? "thumbnail download failed")
            }
        }
    }
    
    func setThumbnailImage(pokemonName: String) {
        
        guard let image  = pokemonImage else {
            let pokemonWebServiceHandler = PokemonWebServiceHandler()
            pokemonWebServiceHandler.pokeManWebService = PokemonWebService()
                   pokemonWebServiceHandler.getPokemonSprite(pokemonName) { result in
                       
                       switch result {
                       case .success(let sprites):
                        self.spritescollection = sprites
                        self.downLoadAndSetImage(sprites: sprites!)
                       
                       case .failure(let error):
                           print(error.errorDescription ?? "thumbnail download failed")
                       
                   }
             }
            return
        }
        
        self.PokemonThumbnailImage.image = image
    }

}
