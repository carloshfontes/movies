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
        
        self.view.backgroundColor = .black


        moviesListVM.delegate = self
        moviesListVM.fetchMovies()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.topItem?.title = "Movies"
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

        
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

extension MoviesListViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
}

extension MoviesListViewController: NotifyMoviesListViewDelegate {
    
    func completeLoading() {
        self.collectionView.reloadData()
    }
}

