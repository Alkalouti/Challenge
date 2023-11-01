//
//  TableViewDataSource.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 30/10/2023.
//

import Foundation
import UIKit

class TableViewDataSource<CellType, Model>: NSObject, UITableViewDataSource where CellType: UITableViewCell {
   
    let cellIdentifier: String
    var items: [Model]
    
    let configureCell: (CellType, Model, IndexPath) -> ()
    
    init(cellIdentifier: String, items: [Model], configureCell: @escaping (CellType, Model, IndexPath) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? CellType else {
            fatalError("cell not found")
        }
        
        let vm = items[indexPath.row]
        
        self.configureCell(cell, vm, indexPath)
        
        return cell
    }
    
    func updateItems(_ items: [Model]) {
        self.items = items
    }
}
