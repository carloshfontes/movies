//
//  Int.swift
//  MoviesApp
//
//  Created by Jonatas Coutinho de Faria on 17/07/20.
//  Copyright © 2020 Carlos Fontes. All rights reserved.
//

import Foundation

extension Int{
    func minutesToHoursMinutes (minutes : Int) -> (hours : Int , leftMinutes : Int) {
        return (minutes / 60, (minutes % 60))
    }
}
