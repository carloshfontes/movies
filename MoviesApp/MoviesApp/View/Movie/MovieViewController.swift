//
//  MovieViewController.swift
//  MoviesApp
//
//  Created by Carlos Fontes on 09/07/20.
//  Copyright © 2020 Carlos Fontes. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var movieUIImage: MovieUIImageView!
    var id: Int?
    var movieViewModel = MovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let id = id {
            movieViewModel.delegate = self
            movieViewModel.fetchMovie(movieID: id)
        }
    }
    
}

extension MovieViewController: NotifyMovieViewModelDelegate{
    func completeLoading() {
        if let movie = movieViewModel.movie, let backdropURL = movie.backdropURL {
            self.movieUIImage.imagePath = backdropURL
            self.overview.text = movie.overview
        }
    }
}
