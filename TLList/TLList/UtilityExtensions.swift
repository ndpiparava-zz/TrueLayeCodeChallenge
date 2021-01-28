//
//  UtilityExtensions.swift
//  TrueLayerApp
//
//  Created by npiparav on 24/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import Foundation
import UIKit


//MARK : Json Parser
extension Bundle {
    
    func decodable<T: Decodable>(_ type : T.Type, from data:Data) -> T?{
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data)  else{
            
            print("Failed to decode from data")
            return nil
        }
        
        return loaded
        
    }
}
