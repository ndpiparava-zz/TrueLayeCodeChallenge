//
//  CoreDataHandler.swift
//  TrueLayerApp
//
//  Created by npiparav on 25/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import UIKit
import CoreData


class PokemonCoreDataHandler: PokemonCoredataHandlerProtocol {
    var favDescriptions: [NSManagedObject] = []

    func getFavoriteDescriptions()-> [String]? {

        let managedContext = CoreDataStack.shared.persistentContainer.viewContext
           let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favourites")

           do {
                self.favDescriptions = try managedContext.fetch(fetchRequest)
                let favDescriptions = self.favDescriptions.map({ description in
                description.value(forKey: "pokemonDescription") as! String
                })
                return favDescriptions
           
           } catch let error as NSError {
             print("Could not fetch. \(error), \(error.userInfo)")
           }
        return nil
    }
    
    
      func addDescriptionToFavourite(description:String) {
        
        var objectToRemove : NSManagedObject?
        var indexToRemove: Int =  -1
        for (index, item) in self.favDescriptions.enumerated() {
            //let isEqual = (x == y)
            if (item.value(forKey: "pokemonDescription") as! String == description) {
                
                objectToRemove = item
                indexToRemove = index
            }
        }
        
        let managedContext = CoreDataStack.shared.persistentContainer.viewContext
        if indexToRemove >= 0 {
            self.favDescriptions.remove(at: indexToRemove)
            do {
                try managedContext.delete(objectToRemove!)
                   try managedContext.save()
              //favourite.append(favourite)
            } catch let error as NSError {
              print("Could not save. \(error), \(error.userInfo)")
            }
        }
        
        else {
          let entity = NSEntityDescription.entity(forEntityName: "Favourites", in: managedContext)!
          let favourite = NSManagedObject(entity: entity, insertInto: managedContext)
          favourite.setValue(description, forKeyPath: "pokemonDescription")
          do {
            try managedContext.save()
            //favourite.append(favourite)
          } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
          }
      }
    }
}
