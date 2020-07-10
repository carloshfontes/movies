//
//  MovieProtocols.swift
//  MoviesApp
//
//  Created by Carlos Fontes on 10/07/20.
//  Copyright © 2020 Carlos Fontes. All rights reserved.
//

import Foundation

protocol NotifyMovieViewModelDelegate{
    func completeLoading()
}


protocol NotifyMoviesListViewDelegate{
    func completeLoading()
}
