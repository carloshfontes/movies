//
//  Movie.swift
//  MoviesApp
//
//  Created by Carlos Fontes on 05/07/20.
//  Copyright © 2020 Carlos Fontes. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let overview: String
    let backdrop_path: String
    let poster_path: String
    let popularity: Double
    let release_date: String
    let vote_average: Double
    let runtime: Int?
    let tagline: String?
    let genres: [Genre]?
    
    var releaseDate: Int? {
        let formatter = Movie.dateFormatter.date(from: release_date)
        return Calendar.current.component(.year, from: formatter ?? Date())
    }
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd"
        return formatter
    }()
    
    public var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(poster_path)")!
    }
    
    public var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/original\(backdrop_path)")!
    }
}


struct Results: Codable{
    let results: [Movie]
}

struct Genre: Codable{
    let id: Int
    let name: String
}


enum MovieError: Error {
    case statusCode
    case decoding
    case other(Error)
    
    static func map(_ error: Error) -> MovieError {
        return (error as? MovieError) ?? .other(error)
    }
}
