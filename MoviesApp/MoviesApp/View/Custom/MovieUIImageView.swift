//
//  MovieUIImageView.swift
//  MoviesApp
//
//  Created by Carlos Fontes on 09/07/20.
//  Copyright © 2020 Carlos Fontes. All rights reserved.
//

import UIKit
import Combine

class MovieUIImageView: UIImageView {

    var cancellabe: AnyCancellable?
    var imagePath: URL? {
        didSet {
            if let imagePath = imagePath {
                let publisher = TmdbAPI.donwloadImage(imagePath)
                
                self.cancellabe = publisher
                    .receive(on: DispatchQueue.main)
                    .sink(receiveCompletion: {_ in
                        print("OK")
                    }, receiveValue: { image in
                        print(image.size)
                        self.image = image
                    })
            }
        }
    }

}
