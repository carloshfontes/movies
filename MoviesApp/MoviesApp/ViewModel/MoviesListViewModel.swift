//
//  MoviesListViewModel.swift
//  MoviesApp
//
//  Created by Carlos Fontes on 09/07/20.
//  Copyright © 2020 Carlos Fontes. All rights reserved.
//

import Foundation
import Combine

class MoviesListViewModel {
    lazy var tmdbAPIPublisher = TmdbAPI.recents(.popularity)
    private var subscriptions = Set<AnyCancellable>()
    var delegate: MovieDelegate?
    var movies: [Movie] = []
    
    func fetchMovies(){
        tmdbAPIPublisher
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
                self.movies = value
                
            })
            .store(in: &subscriptions)
    }
}

protocol MovieDelegate{
    func completeLoading()
}
