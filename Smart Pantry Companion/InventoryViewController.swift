//
//  InventoryViewController.swift
//  Smart Pantry
//
//  Created by Anthony Jones on 1/30/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class InventoryViewController: UITableViewController {
    // MARK: - Initialization
    var items = [InventoryItem]()
    public var count = 0
    
    // MARK: - Server Retrieval
    private func loadItems() {
        // SQL server retrieval code goes here... stores retrieved data into 'items' and the total # of items in 'count'
        // Temporary values until server is implemented
        count = 2
        let barcodeID = ["1A", "2B", "3C"]
        let name = ["Galliker's 2% Reduced Fat Milk", "12-Ct. Large Cage-Free Eggs", "Salted Butter"]
        let price = [Float(2.19), Float(1.48), Float(2.49)]
        let expMonth = [3, 4, 5]
        let expDay = [21, 11, 5]
        let expYear = [2020, 2020, 2020]
        let totalWeight = [16.4, 16, 8]
        let currentWeight = [16.4, 16, 8]

        // Append each inventory item to 'items'
        for i in 0...count {
            let item = InventoryItem()
            item.barcodeID = barcodeID[i]
            item.name = name[i]
            item.price = price[i]
            item.expMonth = expMonth[i]
            item.expDay = expDay[i]
            item.expYear = expYear[i]
            item.totalWeight = totalWeight[i]
            item.currentWeight = currentWeight[i]
            item.exp = String(expMonth[i])
            item.exp += "/"
            item.exp += String(expDay[i])
            item.exp += "/"
            item.exp += String(expYear[i])
            items.append(item)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.loadItems()
        return count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "inv0", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        // Send item name to AccessoryView
        let item = items[indexPath.row]
        let defaults = UserDefaults.standard
        if let encoded = try? JSONEncoder().encode(item) {
            UserDefaults.standard.set(encoded, forKey: "key")
        }
        defaults.synchronize()
    }
    
}
