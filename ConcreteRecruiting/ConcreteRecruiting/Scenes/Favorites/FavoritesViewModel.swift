//
//  FavoritesViewModel.swift
//  ConcreteRecruiting
//
//  Created by Alysson Moreira on 12/01/20.
//  Copyright © 2020 Alysson Moreira. All rights reserved.
//

import Foundation

class FavoritesViewModel {
    
    private let favoriteManager: FavoriteMoviesManager
    
    private var favorites: [Int] {
        didSet {
            self.acquireMovies(from: self.favorites)
        }
    }
    
    private var movieViewModels = [MovieCellViewModel]()
    
    init(favoriteManager: FavoriteMoviesManager) {
        self.favoriteManager = favoriteManager
        self.favorites = self.favoriteManager.getAllFavorites()
    }
    
    // TODO: Change to Localizables
    var title: String {
        return "Favorites"
    }
    
    var removeFilterTitle: String {
        return "Remove Filter"
    }
    
    var unfavoriteTitle: String {
        return "Unfavorite"
    }
    
    var numberOfFavorites: Int {
        return self.movieViewModels.count
    }
    
    private func acquireMovies(from favorites: [Int]) {
        
    }
    
    func getViewModel(for indexPath: IndexPath) -> MovieCellViewModel {
        return self.movieViewModels[indexPath.row]
    }
    
    func didTapFilter() {
        
    }
    
    func removeFilter() {
        
    }
    
    func selectMovie(at indexPath: IndexPath) {
        
    }
    
    func removeFavorite(at indexPath: IndexPath) {
        let viewModel = getViewModel(for: indexPath)
        
        viewModel.didTapFavorite()
    }
    
}
