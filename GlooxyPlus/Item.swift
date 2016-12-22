//
//  Model.swift
//  GlooxyPlus
//
//  Created by Franco on 22/12/16.
//  Copyright © 2016 Telecom Italia. All rights reserved.
//

import Foundation

class Item: NSObject {
    var name: String?
    var liked: Int?
    var image: String?
    var price: Float?
    var GLdescription: String?
    
    
    init(name: String, liked: Int, image: String, price: Float, GLdescription: String)
    {
        self.name = name
        self.liked = liked
        self.image = image
        self.price = price
        self.GLdescription = GLdescription
    }
}
