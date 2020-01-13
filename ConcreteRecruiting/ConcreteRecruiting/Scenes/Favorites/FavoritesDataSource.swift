//
//  FavoritesDataSource.swift
//  ConcreteRecruiting
//
//  Created by Alysson Moreira on 09/01/20.
//  Copyright © 2020 Alysson Moreira. All rights reserved.
//

import UIKit

class FavoritesDataSource: NSObject, UITableViewDataSource {
    
    let viewModel: FavoritesViewModel
    
    init(viewModel: FavoritesViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfFavorites
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? FavoriteTableViewCell else {
            fatalError("Unable to dequeue a cell with the Cell Identifier")
        }
        
        let viewModel = self.viewModel.getViewModel(for: indexPath)
        
        cell.setup(with: viewModel)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            self.viewModel.removeFavorite(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
    }
    
}
