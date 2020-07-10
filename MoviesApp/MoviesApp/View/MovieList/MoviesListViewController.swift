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
    var id: Int?
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet{
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor =  UIColor(red: 0.928358674, green: 0.9319424629, blue: 0.9427042007, alpha: 1)
        

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

extension MoviesListViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {

        self.id = moviesListVM.movies[indexPath.row].id
        performSegue(withIdentifier: "toMovie", sender: nil)
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMovie" {
            if let vc = segue.destination as? MovieViewController, let movieID = self.id{
                vc.id = movieID
            }
        }
    }
}

extension MoviesListViewController: NotifyMoviesListViewDelegate {
    
    func completeLoading() {
        self.collectionView.reloadData()
    }
}

