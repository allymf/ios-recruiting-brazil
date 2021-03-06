//
//  MovieListView.swift
//  ConcreteRecruiting
//
//  Created by Alysson Moreira on 21/12/19.
//  Copyright © 2019 Alysson Moreira. All rights reserved.
//

import UIKit

class MovieListView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        collectionView.backgroundColor = .systemGray6
        
        collectionView.register(MovieCollectionCell.self, forCellWithReuseIdentifier: "MovieCell")
        
        collectionView.isHidden = true
        
        return collectionView
    }()
    
    lazy var errorView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .red
        view.isHidden = true
        
        return view
    }()
    
    lazy var searchErrorView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .gray
        view.isHidden = true
        
        return view
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        
        //activityIndicator.hidesWhenStopped = true
        
        return activityIndicator
    }()
    
    var collectionDataSource: MovieListDataSource? {
        didSet {
            self.collectionView.dataSource = self.collectionDataSource
        }
    }
    var collectionDelegate: MovieListDelegate? {
        didSet {
            self.collectionView.delegate = self.collectionDelegate
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
    
    func setup(with viewModel: MovieListViewModel) {
        
        self.collectionDataSource = MovieListDataSource(with: viewModel)
        self.collectionDelegate = MovieListDelegate(with: viewModel)
        
        viewModel.didChangeLoadingState = { [weak self] (isLoading) in
            DispatchQueue.main.async {
                if isLoading {
                    self?.collectionView.isHidden = true
                    self?.searchErrorView.isHidden = true
                    self?.errorView.isHidden = true
                    self?.activityIndicator.isHidden = false
                    
                    self?.activityIndicator.startAnimating()
                
                } else {
                    self?.collectionView.isHidden = false
                    self?.searchErrorView.isHidden = true
                    self?.errorView.isHidden = true
                    
                    self?.activityIndicator.stopAnimating()
                    
                    self?.activityIndicator.isHidden = true
                }
                    
            }
        }
        
        viewModel.errorWhileLoadingMovies = { [weak self] (error) in
            DispatchQueue.main.async {
                self?.collectionView.isHidden = true
                self?.searchErrorView.isHidden = true
                self?.activityIndicator.isHidden = true
                self?.errorView.isHidden = false
            }
            
            print(error.localizedDescription)
        }
        
        viewModel.noResultsFound = { [weak self] (rationale) in
            DispatchQueue.main.async {
                
                self?.collectionView.isHidden = true
                self?.searchErrorView.isHidden = false
                self?.errorView.isHidden = true
                self?.activityIndicator.isHidden = true
            }
            print(rationale)
        }
        
        viewModel.reloadData = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.isHidden = false
                self?.searchErrorView.isHidden = true
                self?.errorView.isHidden = true
                self?.activityIndicator.isHidden = true
                
                self?.collectionView.reloadData()
            }
        }
        
        viewModel.didBind()
        
    }

}

extension MovieListView {
    
    func addViews() {
        self.addSubviews([self.collectionView,
                        self.errorView,
                        self.searchErrorView,
                        self.activityIndicator])
    }
    
    func setupLayout() {
        self.addViews()
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.errorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.errorView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.errorView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            self.errorView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7)
        ])
        
        NSLayoutConstraint.activate([
            self.searchErrorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.searchErrorView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.searchErrorView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            self.searchErrorView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7)
        ])
        
        NSLayoutConstraint.activate([
            self.activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
    }
    
}
