//
//  Agent.swift
//  MoviesApp
//
//  Created by Carlos Fontes on 05/07/20.
//  Copyright © 2020 Carlos Fontes. All rights reserved.
//

import Combine
import Foundation
import UIKit


struct Agent {
    
    struct Response<T>{
        let value: T
        let response: URLResponse
    }
    
    func runApi(_ request: URLRequest) -> AnyPublisher<[Movie], Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
        .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
        .decode(type: Results.self, decoder: JSONDecoder())
        .tryMap {results -> [Movie] in
            return results.results
        }
        .eraseToAnyPublisher()
    }
    
    func imageLoader(_ request: URLRequest) -> AnyPublisher<UIImage, Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
        .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
        .tryMap {data in
            guard let image = UIImage(data: data) else {
                throw MovieError.statusCode
            }
            return image
        }
        .eraseToAnyPublisher()
    }
}
