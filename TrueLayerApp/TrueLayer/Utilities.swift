//
//  Utilities.swift
//  TrueLayer
//
//  Created by npiparav on 26/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import Foundation
import UIKit


extension Bundle {
    func buildFromStoryboard<T>(_ identifier: String, storyboardName: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
      
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Missing \(identifier) in Storyboard")
        }
        return viewController
    }
}


