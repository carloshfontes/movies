//
//  MoviesListCollectionViewCell.swift
//  MoviesApp
//
//  Created by Carlos Fontes on 09/07/20.
//  Copyright © 2020 Carlos Fontes. All rights reserved.
//

import UIKit

class MoviesListCollectionViewCell: UICollectionViewCell {
    
    var movie: Movie? {
        didSet{
            updateUI()
        }
    }
    
    //Views
    @IBOutlet weak var rateView: UIView!
    @IBOutlet weak var mainGenreView: GenreView!
    @IBOutlet weak var secondGenreView: GenreView!
    
    //Outlets
    @IBOutlet weak var average: UILabel!
    @IBOutlet weak var movieUIImageView: MovieUIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    //buttons
    @IBOutlet weak var favoriteButton: UIButton!
    
    private func updateUI(){
        if let movie = self.movie {
            
            // passing movie data
            self.movieTitle.text = movie.title
            self.movieUIImageView.imagePath = movie.posterURL
            self.average.text = "\(movie.vote_average)"
        }
        
        // setting rateView
        self.rateView.layer.cornerRadius = self.rateView.frame.size.width / 2
        
        // setting image and image layer
        let coverLayer = CALayer()
        coverLayer.frame = movieUIImageView.bounds;
        coverLayer.backgroundColor = UIColor.black.cgColor
        coverLayer.opacity = 0.1
        movieUIImageView.layer.addSublayer(coverLayer)
        movieUIImageView.layer.cornerRadius = 20
        
        // setting cell layer
        self.layer.cornerRadius = 20
        self.layer.shadowRadius = 20
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 1
    }
    
    @IBAction func favoriteButtonAction(_ sender: Any) {
        self.favoriteButton.setImage(UIImage(named: "Red heart"), for: .normal)
    }
}
