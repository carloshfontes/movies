//
//  Movie.swift
//  MoviesApp
//
//  Created by Carlos Fontes on 05/07/20.
//  Copyright © 2020 Carlos Fontes. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let title: String
    let overview: String
    let backdrop_path: String
    let poster_path: String
    let popularity: Double
    let release_date: String
    let vote_average: Double
}


struct Results: Codable{
    let results: [Movie]
}
