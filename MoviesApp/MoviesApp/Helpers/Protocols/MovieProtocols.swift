//
//  MovieProtocols.swift
//  MoviesApp
//
//  Created by Carlos Fontes on 10/07/20.
//  Copyright © 2020 Carlos Fontes. All rights reserved.
//

import Foundation

protocol NotifyMovieViewModelDelegate: class{
    func completeLoading()
}


protocol NotifyMoviesListViewDelegate: class{
    func completeLoading()
}
