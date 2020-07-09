//
//  Tmdb.swift
//  MoviesApp
//
//  Created by Carlos Fontes on 05/07/20.
//  Copyright © 2020 Carlos Fontes. All rights reserved.
//

import Foundation
import Combine
import UIKit

enum TmdbAPI {
    static let agent = Agent()
    static let base = URL(string: "https://api.themoviedb.org/3")!
    static let apiKey = "0e971c7b20bccd213d26fd99f69f725e"
}

enum Endpoint {
    case recents, discover, popularity, image
    
    func path() -> String{
        switch self {
            
        case .recents:
             return "release_date.desc"
        case .discover:
            return ""
        case .popularity:
            return "popularity.desc"
        case .image:
            return ""
        }
    }
}

extension TmdbAPI {

    static func runApi(_ request: URLRequest) -> AnyPublisher<[Movie], Error>{
         return agent.runApi(request)
     }

    
    static func recents(_ endpoint: Endpoint) -> AnyPublisher<[Movie], Error> {

        let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=0e971c7b20bccd213d26fd99f69f725e&language=en-US&sort_by=\(endpoint.path())&include_adult=false&include_video=false&page=1")!
        
        let request = URLRequest(url: url)
        return agent.runApi(request)

    }
    
    static func donwloadImage(_ imagePath: URL) -> AnyPublisher<UIImage, Error>{
        return agent.imageLoader(URLRequest(url: imagePath))
    }
    
    
}

