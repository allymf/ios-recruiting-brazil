//
//  FavoritesViewController.swift
//  ConcreteRecruiting
//
//  Created by Alysson Moreira on 09/01/20.
//  Copyright © 2020 Alysson Moreira. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    private let viewModel: FavoritesViewModel
    
    init(viewModel: FavoritesViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let favoritesView = FavoritesView()
        self.view = favoritesView
        favoritesView.setup(self.viewModel)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Filter"), style: .plain, target: self, action: #selector(didTapFilter))
        
    }
    
    @objc func didTapFilter() {
        
    }

}
