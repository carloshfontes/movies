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
    @IBOutlet weak var movieUIImageView: MovieUIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    
    private func updateUI(){
        if let movie = self.movie {
            self.movieTitle.text = movie.title
            self.movieUIImageView.imagePath = movie.posterURL
            
            self.layer.cornerRadius = 20.0
            self.layer.masksToBounds = true
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 10
            self.layer.shadowOffset = .zero
            self.layer.shadowOpacity = 1

        }
    }
}
