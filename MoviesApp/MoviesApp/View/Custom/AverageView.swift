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
    private var image = UIImageView()
    
    override func didMoveToWindow() {
        
        let starSize = self.frame.size.height / 3
        
        // setting label
        label.frame = CGRect(x: starSize, y: 0,width: (self.frame.size.width - starSize), height: self.frame.size.height)
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.9627555013, green: 0.772800982, blue: 0.09608154744, alpha: 1)
        label.font.withSize(50)
        label.adjustsFontSizeToFitWidth = true
        self.addSubview(label)
        
        // setting the star image
        image.frame = CGRect(x: 0, y: self.frame.size.height / 4, width: starSize, height: starSize)
        image.image = UIImage(named: "Star")
        self.addSubview(image)
        
        //setting view
        self.backgroundColor = .red
        self.label.backgroundColor = .blue
        self.image.backgroundColor = .green
    }
}

