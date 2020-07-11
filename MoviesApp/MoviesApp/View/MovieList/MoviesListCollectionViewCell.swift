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
    
    //Custom Views
    
    @IBOutlet weak var averageView: AverageView!
    @IBOutlet weak var mainGenreView: GenreView!
    @IBOutlet weak var secondGenreView: GenreView!
    
    //Outlets
    @IBOutlet weak var movieUIImageView: MovieUIImageView!
    
    //Buttons
    @IBOutlet weak var favoriteButton: UIButton!
    
    private func updateUI(){
        if let movie = self.movie {
            
            // passing movie data
            self.averageView.label.text = "\(movie.vote_average)"
            self.movieUIImageView.imagePath = movie.posterURL
        }

        // setting image and image layer
        let coverLayer = CALayer()
        coverLayer.frame = movieUIImageView.bounds;
        coverLayer.backgroundColor = UIColor.black.cgColor
        coverLayer.opacity = 0.1
        movieUIImageView.layer.addSublayer(coverLayer)
        movieUIImageView.layer.cornerRadius = 20
        
        // setting cell layer
        self.layer.cornerRadius = 20
        self.layer.shadowRadius = 10
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.4
        
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor(red: 1.00, green: 0.77, blue: 0.00, alpha: 1.00).cgColor
    }
    
    @IBAction func favoriteButtonAction(_ sender: Any) {
        self.favoriteButton.setImage(UIImage(named: "Red heart"), for: .normal)
    }
}
