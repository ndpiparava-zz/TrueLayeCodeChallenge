//
//  CoreDataStack.swift
//  TLList
//
//  Created by npiparav on 26/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()
    var pokemonCoreDataHandler = PokemonCoreDataHandler()
    
    private init(){
        
    }
    
    let frameworkBundleID   = "org.cocoapods.TLList"
    let modelName           = "TrueLayerDB"
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let frameworkBundle = Bundle(identifier: self.frameworkBundleID)
        let modelURL = frameworkBundle!.url(forResource: self.modelName, withExtension: "momd")!
        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)
        
        let container = NSPersistentContainer(name: self.modelName, managedObjectModel: managedObjectModel!)
          //let container = NSPersistentContainer(name: "TLList")
          container.loadPersistentStores(completionHandler: { (storeDescription, error) in
              if let error = error as NSError? {
                  fatalError("Unresolved error \(error), \(error.userInfo)")
              }
          })
          return container
      }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
