//
//  RecipeItem.swift
//  Smart Pantry
//
//  Created by Anthony Jones on 3/11/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class RecipeItem: Codable {
    var name: String?
    var ingredients: [[String]]
    
    init(name: String?, ingredients: [[String]]) {
        self.name = name
        self.ingredients = ingredients
    }
    
    convenience init() {
        self.init(name: "", ingredients: [[String]]())
    }
}
