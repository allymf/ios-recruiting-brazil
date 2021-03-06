//
//  MovieDetailView.swift
//  ConcreteRecruiting
//
//  Created by Alysson Moreira on 07/01/20.
//  Copyright © 2020 Alysson Moreira. All rights reserved.
//

import UIKit

class MovieDetailView: UIView {

    var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = .systemGray6
        
        return tableView
    }()
    
    var tableViewDataSource: MovieDetailDataSource? {
        didSet {
            self.tableView.dataSource = self.tableViewDataSource
        }
    }
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      
      self.backgroundColor = .systemGray6
      self.setupLayout()
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with viewModel: MovieDetailViewModel) {
        
        self.tableViewDataSource = MovieDetailDataSource(with: viewModel)
        
        viewModel.didAcquireGenres = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
    }
    
}

extension MovieDetailView {
    
     func addViews() {
           self.addSubviews([tableView])
       }
       
       func setupLayout() {
           self.addViews()
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }

}
