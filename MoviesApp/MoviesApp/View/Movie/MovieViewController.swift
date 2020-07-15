//
//  MovieViewController.swift
//  MoviesApp
//
//  Created by Carlos Fontes on 09/07/20.
//  Copyright © 2020 Carlos Fontes. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var movieUIImage: MovieUIImageView!
    
    //Custom Views
    @IBOutlet weak var averageView: AverageView!
    
    //Buttons
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    var id: Int?
    var movieViewModel = MovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.view.backgroundColor = .clear
        self.view.backgroundColor =  .black
        setUpImage()
        
        if let id = id {
            movieViewModel.delegate = self
            movieViewModel.fetchMovie(movieID: id)
        }

    }
    
    func setUpImage(){
        // setting image and image layer
        let coverLayer = CALayer()
        coverLayer.frame = movieUIImage.bounds;
        coverLayer.backgroundColor = UIColor.black.cgColor
        coverLayer.opacity = 0.5
        movieUIImage.layer.addSublayer(coverLayer)
    }
    
    @IBAction func favoriteButtonAction(_ sender: Any) {
        self.favoriteButton.setImage(UIImage(named: "Red heart"), for: .normal)
    }
}

extension MovieViewController: NotifyMovieViewModelDelegate{
    func completeLoading() {
        if let movie = movieViewModel.movie, let backdropURL = movie.backdropURL {
            self.movieUIImage.imagePath = backdropURL
            self.overview.text = movie.overview
            self.titleLabel.text = movie.title
            self.averageView.label.text = "\(movie.vote_average)"
        }
    }
}
