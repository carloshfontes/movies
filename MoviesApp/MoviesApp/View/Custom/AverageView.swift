//
//  AverageView.swift
//  MoviesApp
//
//  Created by Jonatas Coutinho de Faria on 10/07/20.
//  Copyright © 2020 Carlos Fontes. All rights reserved.
//

import Foundation
import UIKit

class AverageView: UIView{
    
    var label = UILabel()
    
    override func didMoveToWindow() {
        // setting label
        label.frame = CGRect(x: 0,y: 0,width: self.frame.size.width, height: self.frame.size.height)
        label.textAlignment = .center
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        self.addSubview(label)
        
        //setting view
        self.layer.cornerRadius = self.frame.size.width / 2
        self.backgroundColor = .white
    }
}

