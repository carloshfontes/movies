//
//  MovieViewModel.swift
//  MoviesApp
//
//  Created by Carlos Fontes on 09/07/20.
//  Copyright © 2020 Carlos Fontes. All rights reserved.
//

import Foundation
import Combine

class MovieViewModel{
    var movie: Movie?
    var delegate: NotifyMovieViewModelDelegate?
    var cancellabe: AnyCancellable?
    
    func fetchMovie(movieID: Int){
        let tmdbAPIPublisher = TmdbAPI.fetchMovieByID(id: movieID)
        
        
        cancellabe = tmdbAPIPublisher
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { result in
            
            switch result {
                
            case .finished:
                print("finished")
                self.delegate?.completeLoading()
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }, receiveValue: { value in
            print(value)
            self.movie = value
        })
       
        
    }
}

