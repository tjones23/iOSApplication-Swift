//
//  InventoryItem.swift
//  Smart Pantry
//
//  Created by Anthony Jones on 3/10/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class InventoryItem: Codable {
    var barcodeID: String = ""
    var name: String = ""
    var price: Float = 0.00
    var totalWeight: Double = 0.0
    var currentWeight: Double = 0.0
    var expMonth: Int = 0
    var expDay: Int = 0
    var expYear: Int = 0
    var exp: String = ""
}
