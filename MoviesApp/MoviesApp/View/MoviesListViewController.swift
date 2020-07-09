//
//  ViewController.swift
//  MoviesApp
//
//  Created by Carlos Fontes on 05/07/20.
//  Copyright © 2020 Carlos Fontes. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController {
    let moviesListVM = MoviesListViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor =  UIColor(red: 0.928358674, green: 0.9319424629, blue: 0.9427042007, alpha: 1)
        
        collectionView.dataSource = self
        moviesListVM.delegate = self
        moviesListVM.fetchMovies()
    }


}

extension MoviesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.moviesListVM.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesListCell", for: indexPath) as! MoviesListCollectionViewCell
        
        cell.movie = self.moviesListVM.movies[indexPath.row]
        
        return cell
    }
    
    
}

extension MoviesListViewController: MovieDelegate {
    func completeLoading() {
        self.collectionView.reloadData()
    }
}

