//
//  MockCellDataSource.swift
//  TLListTests
//
//  Created by npiparav on 27/01/21.
//  Copyright © 2021 npiparav. All rights reserved.
//

import Foundation
import  UIKit
@testable import TLList

class MockCellDataSource: NSObject, UITableViewDataSource {
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 1
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          return UITableViewCell()
      }
  }
