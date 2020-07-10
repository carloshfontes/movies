//
//  GenreView.swift
//  MoviesApp
//
//  Created by Jonatas Coutinho de Faria on 09/07/20.
//  Copyright © 2020 Carlos Fontes. All rights reserved.
//

import Foundation
import UIKit

class GenreView: UIView{
    
    var label = UILabel()
    
    override func didMoveToWindow() {
        // setting label
        label.frame = CGRect(x: 5,y: -2,width: self.frame.size.width - 10, height: self.frame.size.height)
        label.textAlignment = .center
        label.text = "Adventure"
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        self.addSubview(label)
        
        //setting view
        self.backgroundColor = .clear
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = self.frame.size.height / 5
    }
}
