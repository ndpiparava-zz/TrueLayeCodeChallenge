//
//  Favourites+CoreDataProperties.swift
//  TLList
//
//  Created by npiparav on 26/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//
//

import Foundation
import CoreData


extension Favourites {

      @nonobjc public class func createFetchRequest() -> NSFetchRequest<Favourites> {
          return NSFetchRequest<Favourites>(entityName: "Favourites")
      }

    @NSManaged public var pokemonDescription: String?

}
